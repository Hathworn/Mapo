; ModuleID = '../data/hip_kernels/360/66/main.cu'
source_filename = "../data/hip_kernels/360/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29permuteInitialAdjacencyKerneliPiS_S_S_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %151

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = bitcast i32 addrspace(1)* %23 to <2 x i32> addrspace(1)*
  %25 = load <2 x i32>, <2 x i32> addrspace(1)* %24, align 4, !tbaa !7
  %26 = extractelement <2 x i32> %25, i64 0
  %27 = extractelement <2 x i32> %25, i64 1
  %28 = sub nsw i32 %27, %26
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %19
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = icmp sgt i32 %28, 0
  br i1 %31, label %32, label %151

32:                                               ; preds = %18
  %33 = xor i32 %26, -1
  %34 = add i32 %27, %33
  %35 = and i32 %28, 7
  %36 = icmp ult i32 %34, 7
  br i1 %36, label %132, label %37

37:                                               ; preds = %32
  %38 = and i32 %28, -8
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i32 [ 0, %37 ], [ %129, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %130, %39 ]
  %42 = add nsw i32 %40, %26
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = add nsw i32 %40, %30
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %50
  store i32 %48, i32 addrspace(1)* %51, align 4, !tbaa !7
  %52 = or i32 %40, 1
  %53 = add nsw i32 %52, %26
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = add nsw i32 %52, %30
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %61
  store i32 %59, i32 addrspace(1)* %62, align 4, !tbaa !7
  %63 = or i32 %40, 2
  %64 = add nsw i32 %63, %26
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7
  %71 = add nsw i32 %63, %30
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %72
  store i32 %70, i32 addrspace(1)* %73, align 4, !tbaa !7
  %74 = or i32 %40, 3
  %75 = add nsw i32 %74, %26
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7
  %82 = add nsw i32 %74, %30
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %83
  store i32 %81, i32 addrspace(1)* %84, align 4, !tbaa !7
  %85 = or i32 %40, 4
  %86 = add nsw i32 %85, %26
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7
  %93 = add nsw i32 %85, %30
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %94
  store i32 %92, i32 addrspace(1)* %95, align 4, !tbaa !7
  %96 = or i32 %40, 5
  %97 = add nsw i32 %96, %26
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7
  %104 = add nsw i32 %96, %30
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %105
  store i32 %103, i32 addrspace(1)* %106, align 4, !tbaa !7
  %107 = or i32 %40, 6
  %108 = add nsw i32 %107, %26
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %112
  %114 = load i32, i32 addrspace(1)* %113, align 4, !tbaa !7
  %115 = add nsw i32 %107, %30
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %116
  store i32 %114, i32 addrspace(1)* %117, align 4, !tbaa !7
  %118 = or i32 %40, 7
  %119 = add nsw i32 %118, %26
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !7
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7
  %126 = add nsw i32 %118, %30
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %127
  store i32 %125, i32 addrspace(1)* %128, align 4, !tbaa !7
  %129 = add nuw nsw i32 %40, 8
  %130 = add i32 %41, 8
  %131 = icmp eq i32 %130, %38
  br i1 %131, label %132, label %39, !llvm.loop !11

132:                                              ; preds = %39, %32
  %133 = phi i32 [ 0, %32 ], [ %129, %39 ]
  %134 = icmp eq i32 %35, 0
  br i1 %134, label %151, label %135

135:                                              ; preds = %132, %135
  %136 = phi i32 [ %148, %135 ], [ %133, %132 ]
  %137 = phi i32 [ %149, %135 ], [ 0, %132 ]
  %138 = add nsw i32 %136, %26
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %139
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !7
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %142
  %144 = load i32, i32 addrspace(1)* %143, align 4, !tbaa !7
  %145 = add nsw i32 %136, %30
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %146
  store i32 %144, i32 addrspace(1)* %147, align 4, !tbaa !7
  %148 = add nuw nsw i32 %136, 1
  %149 = add i32 %137, 1
  %150 = icmp eq i32 %149, %35
  br i1 %150, label %151, label %135, !llvm.loop !13

151:                                              ; preds = %132, %135, %18, %7
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
