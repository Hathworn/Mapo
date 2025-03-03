; ModuleID = '../data/hip_kernels/2890/15/main.cu'
source_filename = "../data/hip_kernels/2890/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26Solve_redblack2_new_KernelPfPKfiiiiS1_S1_ffb(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float %8, float %9, i1 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %12, %20
  %22 = add i32 %21, %14
  %23 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %13, %26
  %28 = add i32 %27, %15
  %29 = srem i32 %28, 2
  %30 = xor i1 %10, true
  %31 = zext i1 %30 to i32
  %32 = add nsw i32 %29, %31
  %33 = shl nsw i32 %22, 1
  %34 = add nsw i32 %32, %33
  %35 = icmp slt i32 %34, %2
  %36 = icmp slt i32 %28, %3
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %126

38:                                               ; preds = %11
  %39 = mul nsw i32 %28, %2
  %40 = add nsw i32 %34, %39
  %41 = mul nsw i32 %4, %2
  %42 = mul nsw i32 %40, %4
  %43 = add nsw i32 %42, %5
  %44 = icmp sgt i32 %28, 0
  br i1 %44, label %45, label %58

45:                                               ; preds = %38
  %46 = sub nsw i32 %40, %2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %7, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = fmul contract float %49, %8
  %51 = fadd contract float %50, 0.000000e+00
  %52 = sub nsw i32 %43, %41
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = fmul contract float %50, %55
  %57 = fadd contract float %56, 0.000000e+00
  br label %58

58:                                               ; preds = %45, %38
  %59 = phi float [ %51, %45 ], [ 0.000000e+00, %38 ]
  %60 = phi float [ %57, %45 ], [ 0.000000e+00, %38 ]
  %61 = add nsw i32 %3, -1
  %62 = icmp slt i32 %28, %61
  br i1 %62, label %63, label %75

63:                                               ; preds = %58
  %64 = sext i32 %40 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %7, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = fmul contract float %66, %8
  %68 = fadd contract float %59, %67
  %69 = add nsw i32 %43, %41
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !6
  %73 = fmul contract float %67, %72
  %74 = fadd contract float %60, %73
  br label %75

75:                                               ; preds = %63, %58
  %76 = phi float [ %68, %63 ], [ %59, %58 ]
  %77 = phi float [ %74, %63 ], [ %60, %58 ]
  %78 = icmp sgt i32 %34, 0
  br i1 %78, label %79, label %92

79:                                               ; preds = %75
  %80 = add nsw i32 %40, -1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %6, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  %84 = fmul contract float %83, %8
  %85 = fadd contract float %76, %84
  %86 = sub nsw i32 %43, %4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = fmul contract float %84, %89
  %91 = fadd contract float %77, %90
  br label %92

92:                                               ; preds = %79, %75
  %93 = phi float [ %85, %79 ], [ %76, %75 ]
  %94 = phi float [ %91, %79 ], [ %77, %75 ]
  %95 = add nsw i32 %2, -1
  %96 = icmp slt i32 %34, %95
  br i1 %96, label %97, label %109

97:                                               ; preds = %92
  %98 = sext i32 %40 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %6, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = fmul contract float %100, %8
  %102 = fadd contract float %93, %101
  %103 = add nsw i32 %43, %4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = fmul contract float %101, %106
  %108 = fadd contract float %94, %107
  br label %109

109:                                              ; preds = %97, %92
  %110 = phi float [ %102, %97 ], [ %93, %92 ]
  %111 = phi float [ %108, %97 ], [ %94, %92 ]
  %112 = fadd contract float %110, 1.000000e+00
  %113 = sext i32 %43 to i64
  %114 = fcmp contract ogt float %112, 0.000000e+00
  br i1 %114, label %115, label %126

115:                                              ; preds = %109
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  %118 = fadd contract float %111, %117
  %119 = fdiv contract float %118, %112
  %120 = fmul contract float %119, %9
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = fsub contract float 1.000000e+00, %9
  %124 = fmul contract float %123, %122
  %125 = fadd contract float %124, %120
  store float %125, float addrspace(1)* %121, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %109, %115, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
