; ModuleID = '../data/hip_kernels/8192/379/main.cu'
source_filename = "../data/hip_kernels/8192/379/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z30BilinearResampleSubImageKernelPfS_S_biiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i1 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = udiv i32 %16, %13
  %20 = mul i32 %19, %13
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %18
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %17
  %27 = mul i32 %26, %13
  %28 = add i32 %27, %25
  %29 = mul nsw i32 %7, %6
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %138

31:                                               ; preds = %8
  %32 = load float, float addrspace(1)* %2, align 4, !tbaa !16, !amdgpu.noclobber !5
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !5
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !5
  %37 = add nsw i32 %4, -1
  %38 = add nsw i32 %5, -1
  %39 = tail call i32 @llvm.smin.i32(i32 %37, i32 %38)
  %40 = sitofp i32 %39 to float
  %41 = fmul contract float %36, %40
  %42 = fptosi float %41 to i32
  %43 = tail call i32 @llvm.smax.i32(i32 %42, i32 1)
  %44 = tail call i32 @llvm.smin.i32(i32 %39, i32 %43)
  %45 = sitofp i32 %4 to float
  %46 = fadd contract float %32, 1.000000e+00
  %47 = fmul contract float %46, %45
  %48 = fmul contract float %47, 5.000000e-01
  %49 = fptosi float %48 to i32
  %50 = sdiv i32 %44, 2
  %51 = sub nsw i32 %49, %50
  %52 = sitofp i32 %5 to float
  %53 = fadd contract float %34, 1.000000e+00
  %54 = fmul contract float %53, %52
  %55 = fmul contract float %54, 5.000000e-01
  %56 = fptosi float %55 to i32
  %57 = sub nsw i32 %56, %50
  br i1 %3, label %58, label %66

58:                                               ; preds = %31
  %59 = tail call i32 @llvm.smax.i32(i32 %51, i32 1)
  %60 = tail call i32 @llvm.smax.i32(i32 %57, i32 1)
  %61 = xor i32 %44, -1
  %62 = add i32 %61, %4
  %63 = tail call i32 @llvm.smin.i32(i32 %59, i32 %62)
  %64 = add i32 %61, %5
  %65 = tail call i32 @llvm.smin.i32(i32 %60, i32 %64)
  br label %66

66:                                               ; preds = %58, %31
  %67 = phi i32 [ %65, %58 ], [ %57, %31 ]
  %68 = phi i32 [ %63, %58 ], [ %51, %31 ]
  %69 = freeze i32 %28
  %70 = freeze i32 %6
  %71 = sdiv i32 %69, %70
  %72 = mul i32 %71, %70
  %73 = sub i32 %69, %72
  %74 = add nsw i32 %44, -1
  %75 = sitofp i32 %74 to float
  %76 = add nsw i32 %6, -1
  %77 = sitofp i32 %76 to float
  %78 = fdiv contract float %75, %77
  %79 = add nsw i32 %7, -1
  %80 = sitofp i32 %79 to float
  %81 = fdiv contract float %75, %80
  %82 = sitofp i32 %73 to float
  %83 = fmul contract float %78, %82
  %84 = fptosi float %83 to i32
  %85 = sitofp i32 %71 to float
  %86 = fmul contract float %81, %85
  %87 = fptosi float %86 to i32
  %88 = add i32 %68, %84
  %89 = icmp sgt i32 %88, -1
  br i1 %89, label %90, label %138

90:                                               ; preds = %66
  %91 = add nsw i32 %67, %87
  %92 = icmp sgt i32 %91, -1
  %93 = icmp slt i32 %88, %4
  %94 = select i1 %92, i1 %93, i1 false
  %95 = icmp slt i32 %91, %5
  %96 = select i1 %94, i1 %95, i1 false
  br i1 %96, label %97, label %138

97:                                               ; preds = %90
  %98 = sitofp i32 %84 to float
  %99 = fsub contract float %83, %98
  %100 = sitofp i32 %87 to float
  %101 = fsub contract float %86, %100
  %102 = mul nsw i32 %91, %4
  %103 = add i32 %88, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16, !amdgpu.noclobber !5
  %107 = add nsw i32 %103, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16, !amdgpu.noclobber !5
  %111 = add nuw nsw i32 %91, 1
  %112 = mul nsw i32 %111, %4
  %113 = add i32 %88, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16, !amdgpu.noclobber !5
  %117 = add nsw i32 %113, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16, !amdgpu.noclobber !5
  %121 = fsub contract float 1.000000e+00, %99
  %122 = fmul contract float %121, %106
  %123 = fsub contract float 1.000000e+00, %101
  %124 = fmul contract float %123, %122
  %125 = fmul contract float %99, %110
  %126 = fmul contract float %123, %125
  %127 = fadd contract float %124, %126
  %128 = fmul contract float %101, %116
  %129 = fmul contract float %121, %128
  %130 = fadd contract float %127, %129
  %131 = fmul contract float %99, %120
  %132 = fmul contract float %101, %131
  %133 = fadd contract float %130, %132
  %134 = mul nsw i32 %71, %6
  %135 = add nsw i32 %134, %73
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  store float %133, float addrspace(1)* %137, align 4, !tbaa !16
  br label %138

138:                                              ; preds = %66, %90, %97, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
