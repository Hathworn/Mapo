; ModuleID = '../data/hip_kernels/5182/380/main.cu'
source_filename = "../data/hip_kernels/5182/380/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z47BilinearResampleSubImageKernel_ForManyProposalsPKfPfS0_biiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i1 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = udiv i32 %19, %16
  %23 = mul i32 %22, %16
  %24 = icmp ugt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %20
  %30 = mul i32 %29, %16
  %31 = add i32 %30, %28
  %32 = freeze i32 %31
  %33 = freeze i32 %7
  %34 = sdiv i32 %32, %33
  %35 = mul i32 %34, %33
  %36 = sub i32 %32, %35
  %37 = freeze i32 %8
  %38 = sdiv i32 %34, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %34, %39
  %41 = icmp slt i32 %31, %10
  br i1 %41, label %42, label %153

42:                                               ; preds = %11
  %43 = mul nsw i32 %38, %4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !5
  %47 = add nsw i32 %43, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !5
  %51 = add nsw i32 %43, 2
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16, !amdgpu.noclobber !5
  %55 = add nsw i32 %5, -1
  %56 = add nsw i32 %6, -1
  %57 = tail call i32 @llvm.smin.i32(i32 %55, i32 %56)
  %58 = sitofp i32 %57 to float
  %59 = fmul contract float %54, %58
  %60 = fptosi float %59 to i32
  %61 = tail call i32 @llvm.smax.i32(i32 %60, i32 1)
  %62 = tail call i32 @llvm.smin.i32(i32 %57, i32 %61)
  %63 = sitofp i32 %5 to float
  %64 = fadd contract float %46, 1.000000e+00
  %65 = fmul contract float %64, %63
  %66 = fmul contract float %65, 5.000000e-01
  %67 = fptosi float %66 to i32
  %68 = sdiv i32 %62, 2
  %69 = sub nsw i32 %67, %68
  %70 = sitofp i32 %6 to float
  %71 = fadd contract float %50, 1.000000e+00
  %72 = fmul contract float %71, %70
  %73 = fmul contract float %72, 5.000000e-01
  %74 = fptosi float %73 to i32
  %75 = sub nsw i32 %74, %68
  br i1 %3, label %76, label %84

76:                                               ; preds = %42
  %77 = tail call i32 @llvm.smax.i32(i32 %69, i32 1)
  %78 = tail call i32 @llvm.smax.i32(i32 %75, i32 1)
  %79 = xor i32 %62, -1
  %80 = add i32 %79, %5
  %81 = tail call i32 @llvm.smin.i32(i32 %77, i32 %80)
  %82 = add i32 %79, %6
  %83 = tail call i32 @llvm.smin.i32(i32 %78, i32 %82)
  br label %84

84:                                               ; preds = %76, %42
  %85 = phi i32 [ %83, %76 ], [ %75, %42 ]
  %86 = phi i32 [ %81, %76 ], [ %69, %42 ]
  %87 = add nsw i32 %62, -1
  %88 = sitofp i32 %87 to float
  %89 = add nsw i32 %7, -1
  %90 = sitofp i32 %89 to float
  %91 = fdiv contract float %88, %90
  %92 = add nsw i32 %8, -1
  %93 = sitofp i32 %92 to float
  %94 = fdiv contract float %88, %93
  %95 = sitofp i32 %36 to float
  %96 = fmul contract float %91, %95
  %97 = fptosi float %96 to i32
  %98 = sitofp i32 %40 to float
  %99 = fmul contract float %94, %98
  %100 = fptosi float %99 to i32
  %101 = add i32 %86, %97
  %102 = icmp sgt i32 %101, -1
  br i1 %102, label %103, label %153

103:                                              ; preds = %84
  %104 = add nsw i32 %85, %100
  %105 = icmp sgt i32 %104, -1
  %106 = icmp slt i32 %101, %5
  %107 = select i1 %105, i1 %106, i1 false
  %108 = icmp slt i32 %104, %6
  %109 = select i1 %107, i1 %108, i1 false
  br i1 %109, label %110, label %153

110:                                              ; preds = %103
  %111 = sitofp i32 %97 to float
  %112 = fsub contract float %96, %111
  %113 = sitofp i32 %100 to float
  %114 = fsub contract float %99, %113
  %115 = mul nsw i32 %104, %5
  %116 = add i32 %101, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !5
  %120 = add nsw i32 %116, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !5
  %124 = add nuw nsw i32 %104, 1
  %125 = mul nsw i32 %124, %5
  %126 = add i32 %101, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !16, !amdgpu.noclobber !5
  %130 = add nsw i32 %126, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16, !amdgpu.noclobber !5
  %134 = fsub contract float 1.000000e+00, %112
  %135 = fmul contract float %134, %119
  %136 = fsub contract float 1.000000e+00, %114
  %137 = fmul contract float %136, %135
  %138 = fmul contract float %112, %123
  %139 = fmul contract float %136, %138
  %140 = fadd contract float %137, %139
  %141 = fmul contract float %114, %129
  %142 = fmul contract float %134, %141
  %143 = fadd contract float %140, %142
  %144 = fmul contract float %112, %133
  %145 = fmul contract float %114, %144
  %146 = fadd contract float %143, %145
  %147 = mul i32 %38, %8
  %148 = add i32 %147, %40
  %149 = mul i32 %148, %7
  %150 = add i32 %149, %36
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  store float %146, float addrspace(1)* %152, align 4, !tbaa !16
  br label %153

153:                                              ; preds = %84, %103, %110, %11
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
