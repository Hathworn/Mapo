; ModuleID = '../data/hip_kernels/13765/10/main.cu'
source_filename = "../data/hip_kernels/13765/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@smax = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z4cmaxPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = add i32 %12, %2
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = fcmp contract ogt float %15, %19
  %21 = select contract i1 %20, float %15, float %19
  %22 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %4
  store float %21, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = icmp ugt i16 %9, 512
  %24 = icmp ult i32 %4, 512
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %33

26:                                               ; preds = %3
  %27 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %28 = add nuw nsw i32 %4, 512
  %29 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !7
  %31 = fcmp contract olt float %27, %30
  br i1 %31, label %32, label %33

32:                                               ; preds = %26
  store float %30, float addrspace(3)* %22, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %26, %32, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ugt i16 %9, 256
  %35 = icmp ult i32 %4, 256
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %44

37:                                               ; preds = %33
  %38 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %39 = add nuw nsw i32 %4, 256
  %40 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %39
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %42 = fcmp contract olt float %38, %41
  br i1 %42, label %43, label %44

43:                                               ; preds = %37
  store float %41, float addrspace(3)* %22, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %37, %43, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ugt i16 %9, 128
  %46 = icmp ult i32 %4, 128
  %47 = select i1 %45, i1 %46, i1 false
  br i1 %47, label %48, label %55

48:                                               ; preds = %44
  %49 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %50 = add nuw nsw i32 %4, 128
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %53 = fcmp contract olt float %49, %52
  br i1 %53, label %54, label %55

54:                                               ; preds = %48
  store float %52, float addrspace(3)* %22, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %48, %54, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ugt i16 %9, 64
  %57 = icmp ult i32 %4, 64
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %66

59:                                               ; preds = %55
  %60 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %61 = add nuw nsw i32 %4, 64
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %64 = fcmp contract olt float %60, %63
  br i1 %64, label %65, label %66

65:                                               ; preds = %59
  store float %63, float addrspace(3)* %22, align 4, !tbaa !7
  br label %66

66:                                               ; preds = %59, %65, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = icmp ult i32 %4, 32
  br i1 %67, label %68, label %121

68:                                               ; preds = %66
  %69 = icmp ugt i16 %9, 32
  br i1 %69, label %70, label %77

70:                                               ; preds = %68
  %71 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %72 = add nuw nsw i32 %4, 32
  %73 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %75 = fcmp contract olt float %71, %74
  br i1 %75, label %76, label %77

76:                                               ; preds = %70
  store float %74, float addrspace(3)* %22, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %76, %70, %68
  %78 = icmp ugt i16 %9, 16
  br i1 %78, label %79, label %86

79:                                               ; preds = %77
  %80 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %81 = add nuw nsw i32 %4, 16
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %84 = fcmp contract olt float %80, %83
  br i1 %84, label %85, label %86

85:                                               ; preds = %79
  store float %83, float addrspace(3)* %22, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %85, %79, %77
  %87 = icmp ugt i16 %9, 8
  br i1 %87, label %88, label %95

88:                                               ; preds = %86
  %89 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %90 = add nuw nsw i32 %4, 8
  %91 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %93 = fcmp contract olt float %89, %92
  br i1 %93, label %94, label %95

94:                                               ; preds = %88
  store float %92, float addrspace(3)* %22, align 4, !tbaa !7
  br label %95

95:                                               ; preds = %94, %88, %86
  %96 = icmp ugt i16 %9, 4
  br i1 %96, label %97, label %104

97:                                               ; preds = %95
  %98 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %99 = add nuw nsw i32 %4, 4
  %100 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %99
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !7
  %102 = fcmp contract olt float %98, %101
  br i1 %102, label %103, label %104

103:                                              ; preds = %97
  store float %101, float addrspace(3)* %22, align 4, !tbaa !7
  br label %104

104:                                              ; preds = %103, %97, %95
  %105 = icmp ugt i16 %9, 2
  %106 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  br i1 %105, label %107, label %113

107:                                              ; preds = %104
  %108 = add nuw nsw i32 %4, 2
  %109 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %108
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !7
  %111 = fcmp contract olt float %106, %110
  br i1 %111, label %112, label %113

112:                                              ; preds = %107
  store float %110, float addrspace(3)* %22, align 4, !tbaa !7
  br label %113

113:                                              ; preds = %104, %112, %107
  %114 = phi float [ %110, %112 ], [ %106, %107 ], [ %106, %104 ]
  %115 = add nuw nsw i32 %4, 1
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 %115
  %117 = load float, float addrspace(3)* %116, align 4, !tbaa !7
  %118 = fcmp contract olt float %114, %117
  br i1 %118, label %119, label %120

119:                                              ; preds = %113
  store float %117, float addrspace(3)* %22, align 4, !tbaa !7
  br label %120

120:                                              ; preds = %119, %113
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %121

121:                                              ; preds = %120, %66
  %122 = icmp eq i32 %4, 0
  br i1 %122, label %123, label %127

123:                                              ; preds = %121
  %124 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @smax, i32 0, i32 0), align 4, !tbaa !7
  %125 = zext i32 %5 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  store float %124, float addrspace(1)* %126, align 4, !tbaa !7
  br label %127

127:                                              ; preds = %123, %121
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
