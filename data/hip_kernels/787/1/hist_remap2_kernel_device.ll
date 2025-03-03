; ModuleID = '../data/hip_kernels/787/1/main.cu'
source_filename = "../data/hip_kernels/787/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18hist_remap2_kernelPfiS_S_S_S_S_iS_PiS_iii(float addrspace(1)* nocapture readnone %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, float addrspace(1)* nocapture readnone %8, i32 addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture writeonly %10, i32 %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %15, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %13, %12
  %25 = mul nsw i32 %24, %11
  %26 = icmp slt i32 %23, %25
  br i1 %26, label %27, label %135

27:                                               ; preds = %14
  %28 = freeze i32 %23
  %29 = freeze i32 %24
  %30 = sdiv i32 %28, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %5, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = getelementptr inbounds float, float addrspace(1)* %6, i64 %31
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fsub contract float %35, %33
  %37 = sitofp i32 %7 to float
  %38 = fdiv contract float %36, %37
  %39 = sext i32 %23 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !11, !amdgpu.noclobber !5
  %42 = add nsw i32 %41, -1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = fpext float %45 to double
  %47 = fcmp contract uge double %46, 1.000000e-01
  br i1 %47, label %48, label %135

48:                                               ; preds = %27
  %49 = mul i32 %30, %29
  %50 = sub i32 %28, %49
  %51 = sub i32 %1, %24
  %52 = add i32 %50, %51
  %53 = add nsw i32 %7, -1
  %54 = sdiv i32 %53, 2
  %55 = mul nsw i32 %30, %7
  %56 = sitofp i32 %52 to float
  %57 = add nsw i32 %53, %55
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %4, i64 %58
  br label %60

60:                                               ; preds = %101, %48
  %61 = phi i32 [ -1, %48 ], [ %102, %101 ]
  %62 = phi i32 [ %54, %48 ], [ %103, %101 ]
  %63 = phi i32 [ %53, %48 ], [ %104, %101 ]
  %64 = phi i32 [ 0, %48 ], [ %105, %101 ]
  %65 = icmp sgt i32 %64, %63
  br i1 %65, label %107, label %66

66:                                               ; preds = %60
  %67 = icmp eq i32 %62, %53
  br i1 %67, label %68, label %71

68:                                               ; preds = %66
  %69 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fadd contract float %69, 5.000000e-01
  br label %76

71:                                               ; preds = %66
  %72 = add nsw i32 %62, %55
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %4, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %76

76:                                               ; preds = %71, %68
  %77 = phi contract float [ %70, %68 ], [ %75, %71 ]
  %78 = icmp eq i32 %62, 0
  br i1 %78, label %85, label %79

79:                                               ; preds = %76
  %80 = add nsw i32 %62, -1
  %81 = add i32 %80, %55
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %4, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %85

85:                                               ; preds = %76, %79
  %86 = phi contract float [ %84, %79 ], [ -5.000000e-01, %76 ]
  %87 = fcmp contract ugt float %77, %56
  br i1 %87, label %91, label %88

88:                                               ; preds = %85
  %89 = add nsw i32 %62, 1
  %90 = add nsw i32 %89, %63
  br label %96

91:                                               ; preds = %85
  %92 = fcmp contract ogt float %86, %56
  br i1 %92, label %93, label %101

93:                                               ; preds = %91
  %94 = add nsw i32 %62, -1
  %95 = add nsw i32 %64, %94
  br label %96

96:                                               ; preds = %93, %88
  %97 = phi i32 [ %90, %88 ], [ %95, %93 ]
  %98 = phi i32 [ %63, %88 ], [ %94, %93 ]
  %99 = phi i32 [ %89, %88 ], [ %64, %93 ]
  %100 = sdiv i32 %97, 2
  br label %101

101:                                              ; preds = %91, %96
  %102 = phi i32 [ %61, %96 ], [ %62, %91 ]
  %103 = phi i32 [ %100, %96 ], [ %62, %91 ]
  %104 = phi i32 [ %98, %96 ], [ %63, %91 ]
  %105 = phi i32 [ %99, %96 ], [ %64, %91 ]
  %106 = phi i1 [ true, %96 ], [ false, %91 ]
  br i1 %106, label %60, label %107

107:                                              ; preds = %101, %60
  %108 = phi i32 [ %102, %101 ], [ %61, %60 ]
  %109 = add nsw i32 %108, %55
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %3, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = getelementptr inbounds float, float addrspace(1)* %4, i64 %110
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fsub contract float %112, %114
  %116 = fadd contract float %115, %56
  %117 = fpext float %116 to double
  %118 = fpext float %112 to double
  %119 = fadd contract double %118, 1.000000e-08
  %120 = fdiv contract double %117, %119
  %121 = fcmp contract ogt double %120, 0.000000e+00
  %122 = fcmp contract uge double %120, 1.000000e+00
  %123 = and i1 %121, %122
  %124 = select i1 %121, double %120, double 0.000000e+00
  %125 = fptrunc double %124 to float
  %126 = select i1 %123, float 1.000000e+00, float %125
  %127 = sitofp i32 %108 to float
  %128 = fadd contract float %126, %127
  %129 = fmul contract float %38, %128
  %130 = fadd contract float %33, %129
  %131 = mul nsw i32 %30, %24
  %132 = add nsw i32 %42, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %10, i64 %133
  store float %130, float addrspace(1)* %134, align 4, !tbaa !7
  br label %135

135:                                              ; preds = %107, %27, %14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
