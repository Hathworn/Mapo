; ModuleID = '../data/hip_kernels/5182/381/main.cu'
source_filename = "../data/hip_kernels/5182/381/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25BilinearAddSubImageKernelPfS_S_iiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = load float, float addrspace(1)* %2, align 4, !tbaa !16, !amdgpu.noclobber !5
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = tail call i32 @llvm.smin.i32(i32 %3, i32 %4)
  %32 = sitofp i32 %31 to float
  %33 = fmul contract float %30, %32
  %34 = fptosi float %33 to i32
  %35 = tail call i32 @llvm.smax.i32(i32 %34, i32 1)
  %36 = sitofp i32 %3 to float
  %37 = fadd contract float %28, 1.000000e+00
  %38 = fmul contract float %37, %36
  %39 = fmul contract float %38, 5.000000e-01
  %40 = fptosi float %39 to i32
  %41 = lshr i32 %35, 1
  %42 = sub nsw i32 %40, %41
  %43 = freeze i32 %27
  %44 = freeze i32 %35
  %45 = sdiv i32 %43, %44
  %46 = mul i32 %45, %44
  %47 = sub i32 %43, %46
  %48 = add i32 %42, %47
  %49 = icmp sgt i32 %48, -1
  br i1 %49, label %50, label %123

50:                                               ; preds = %7
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16, !amdgpu.noclobber !5
  %53 = fadd contract float %52, 1.000000e+00
  %54 = sitofp i32 %4 to float
  %55 = fmul contract float %53, %54
  %56 = fmul contract float %55, 5.000000e-01
  %57 = fptosi float %56 to i32
  %58 = sub nsw i32 %57, %41
  %59 = add nsw i32 %58, %45
  %60 = icmp sgt i32 %59, -1
  %61 = icmp slt i32 %48, %3
  %62 = select i1 %60, i1 %61, i1 false
  %63 = icmp slt i32 %59, %4
  %64 = select i1 %62, i1 %63, i1 false
  %65 = icmp slt i32 %45, %35
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %123

67:                                               ; preds = %50
  %68 = add nsw i32 %5, -1
  %69 = sitofp i32 %68 to float
  %70 = sitofp i32 %35 to float
  %71 = fdiv contract float %69, %70
  %72 = add nsw i32 %6, -1
  %73 = sitofp i32 %72 to float
  %74 = fdiv contract float %73, %70
  %75 = sitofp i32 %47 to float
  %76 = fmul contract float %71, %75
  %77 = fptosi float %76 to i32
  %78 = sitofp i32 %45 to float
  %79 = fmul contract float %74, %78
  %80 = fptosi float %79 to i32
  %81 = sitofp i32 %77 to float
  %82 = fsub contract float %76, %81
  %83 = sitofp i32 %80 to float
  %84 = fsub contract float %79, %83
  %85 = mul nsw i32 %80, %5
  %86 = add nsw i32 %85, %77
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16, !amdgpu.noclobber !5
  %90 = add nsw i32 %86, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16, !amdgpu.noclobber !5
  %94 = add nsw i32 %80, 1
  %95 = mul nsw i32 %94, %5
  %96 = add nsw i32 %95, %77
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16, !amdgpu.noclobber !5
  %100 = add nsw i32 %96, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16, !amdgpu.noclobber !5
  %104 = fsub contract float 1.000000e+00, %82
  %105 = fmul contract float %104, %89
  %106 = fsub contract float 1.000000e+00, %84
  %107 = fmul contract float %106, %105
  %108 = fmul contract float %82, %93
  %109 = fmul contract float %106, %108
  %110 = fadd contract float %107, %109
  %111 = fmul contract float %84, %99
  %112 = fmul contract float %104, %111
  %113 = fadd contract float %110, %112
  %114 = fmul contract float %82, %103
  %115 = fmul contract float %84, %114
  %116 = fadd contract float %113, %115
  %117 = mul nsw i32 %59, %3
  %118 = add i32 %48, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16, !amdgpu.noclobber !5
  %122 = fadd contract float %121, %116
  store float %122, float addrspace(1)* %120, align 4, !tbaa !16
  br label %123

123:                                              ; preds = %67, %50, %7
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
