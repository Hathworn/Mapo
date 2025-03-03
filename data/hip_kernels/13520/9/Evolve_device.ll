; ModuleID = '../data/hip_kernels/13520/9/main.cu'
source_filename = "../data/hip_kernels/13520/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6EvolvePiS_iE5sdata = internal unnamed_addr addrspace(3) global [18 x [18 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z6EvolvePiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = add nuw nsw i32 %4, 1
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = add nuw nsw i32 %6, 1
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %4
  %23 = mul nsw i32 %15, %2
  %24 = add nsw i32 %23, %22
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = sitofp i32 %27 to float
  %29 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %7, i32 %5
  store float %28, float addrspace(3)* %29, align 4, !tbaa !11
  %30 = icmp eq i32 %4, 0
  %31 = icmp eq i32 %6, 0
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %60

33:                                               ; preds = %3
  %34 = add nsw i32 %14, -1
  %35 = mul nsw i32 %34, %2
  %36 = add nsw i32 %35, %21
  %37 = add nsw i32 %36, -1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = sitofp i32 %40 to float
  store float %41, float addrspace(3)* getelementptr inbounds ([18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 0, i32 0), align 16, !tbaa !11
  %42 = add nsw i32 %36, 16
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = sitofp i32 %45 to float
  store float %46, float addrspace(3)* getelementptr inbounds ([18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 0, i32 17), align 4, !tbaa !11
  %47 = add nsw i32 %14, 16
  %48 = mul nsw i32 %47, %2
  %49 = add nsw i32 %48, %21
  %50 = add nsw i32 %49, -1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = sitofp i32 %53 to float
  store float %54, float addrspace(3)* getelementptr inbounds ([18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 17, i32 0), align 8, !tbaa !11
  %55 = add nsw i32 %49, 16
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = sitofp i32 %58 to float
  store float %59, float addrspace(3)* getelementptr inbounds ([18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 17, i32 17), align 4, !tbaa !11
  br label %60

60:                                               ; preds = %33, %3
  %61 = icmp sgt i32 %22, 0
  %62 = and i1 %30, %61
  br i1 %62, label %63, label %70

63:                                               ; preds = %60
  %64 = add nsw i32 %24, -1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = sitofp i32 %67 to float
  %69 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %7, i32 0
  store float %68, float addrspace(3)* %69, align 8, !tbaa !11
  br label %70

70:                                               ; preds = %63, %60
  %71 = add nsw i32 %2, -1
  %72 = icmp slt i32 %22, %71
  %73 = icmp eq i32 %5, 16
  %74 = select i1 %72, i1 %73, i1 false
  br i1 %74, label %75, label %82

75:                                               ; preds = %70
  %76 = add nsw i32 %24, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  %80 = sitofp i32 %79 to float
  %81 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %7, i32 17
  store float %80, float addrspace(3)* %81, align 4, !tbaa !11
  br label %82

82:                                               ; preds = %75, %70
  %83 = icmp sgt i32 %15, 0
  %84 = and i1 %31, %83
  br i1 %84, label %85, label %94

85:                                               ; preds = %82
  %86 = add nsw i32 %15, -1
  %87 = mul nsw i32 %86, %2
  %88 = add nsw i32 %87, %22
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !6
  %92 = sitofp i32 %91 to float
  %93 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 0, i32 %5
  store float %92, float addrspace(3)* %93, align 4, !tbaa !11
  br label %94

94:                                               ; preds = %85, %82
  %95 = icmp slt i32 %15, %71
  %96 = icmp eq i32 %7, 16
  %97 = select i1 %95, i1 %96, i1 false
  br i1 %97, label %98, label %107

98:                                               ; preds = %94
  %99 = add nsw i32 %15, 1
  %100 = mul nsw i32 %99, %2
  %101 = add nsw i32 %100, %22
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = sitofp i32 %104 to float
  %106 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 17, i32 %5
  store float %105, float addrspace(3)* %106, align 4, !tbaa !11
  br label %107

107:                                              ; preds = %98, %94
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = select i1 %83, i1 %95, i1 false
  %109 = select i1 %108, i1 %61, i1 false
  %110 = select i1 %109, i1 %72, i1 false
  br i1 %110, label %111, label %157

111:                                              ; preds = %107
  %112 = load float, float addrspace(3)* %29, align 4, !tbaa !11
  %113 = fptosi float %112 to i32
  %114 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %6, i32 %5
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !11
  %116 = fptosi float %115 to i32
  %117 = add nuw nsw i32 %4, 2
  %118 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %6, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !11
  %120 = fptosi float %119 to i32
  %121 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %7, i32 %117
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !11
  %123 = fptosi float %122 to i32
  %124 = add nuw nsw i32 %6, 2
  %125 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %124, i32 %117
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !11
  %127 = fptosi float %126 to i32
  %128 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %124, i32 %5
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !11
  %130 = fptosi float %129 to i32
  %131 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %124, i32 %4
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !11
  %133 = fptosi float %132 to i32
  %134 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %7, i32 %4
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !11
  %136 = fptosi float %135 to i32
  %137 = getelementptr inbounds [18 x [18 x float]], [18 x [18 x float]] addrspace(3)* @_ZZ6EvolvePiS_iE5sdata, i32 0, i32 %6, i32 %4
  %138 = load float, float addrspace(3)* %137, align 4, !tbaa !11
  %139 = fptosi float %138 to i32
  %140 = add nsw i32 %120, %116
  %141 = add nsw i32 %140, %123
  %142 = add nsw i32 %141, %127
  %143 = add nsw i32 %142, %130
  %144 = add nsw i32 %143, %133
  %145 = add nsw i32 %144, %136
  %146 = add nsw i32 %145, %139
  %147 = icmp eq i32 %146, 3
  br i1 %147, label %154, label %148

148:                                              ; preds = %111
  %149 = icmp eq i32 %113, 1
  %150 = and i32 %146, -2
  %151 = icmp eq i32 %150, 2
  %152 = zext i1 %151 to i32
  %153 = select i1 %149, i32 %152, i32 %113
  br label %154

154:                                              ; preds = %148, %111
  %155 = phi i32 [ 1, %111 ], [ %153, %148 ]
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  store i32 %155, i32 addrspace(1)* %156, align 4, !tbaa !7
  br label %157

157:                                              ; preds = %107, %154
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
