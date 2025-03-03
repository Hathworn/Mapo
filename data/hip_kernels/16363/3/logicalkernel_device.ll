; ModuleID = '../data/hip_kernels/16363/3/main.cu'
source_filename = "../data/hip_kernels/16363/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13logicalkernelPbS_Piii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %3
  %16 = icmp sgt i32 %4, 0
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %124

18:                                               ; preds = %5
  %19 = mul nsw i32 %14, %4
  %20 = icmp sgt i32 %3, 0
  %21 = mul nsw i32 %14, %3
  %22 = and i32 %3, 3
  %23 = icmp ult i32 %3, 4
  %24 = and i32 %3, -4
  %25 = icmp eq i32 %22, 0
  br label %26

26:                                               ; preds = %18, %56
  %27 = phi i32 [ 0, %18 ], [ %57, %56 ]
  br i1 %20, label %28, label %56

28:                                               ; preds = %26
  %29 = add nsw i32 %27, %19
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = mul nsw i32 %32, %3
  br i1 %23, label %34, label %59

34:                                               ; preds = %118, %28
  %35 = phi i32 [ 0, %28 ], [ %121, %118 ]
  br i1 %25, label %56, label %36

36:                                               ; preds = %34, %50
  %37 = phi i32 [ %53, %50 ], [ %35, %34 ]
  %38 = phi i32 [ %54, %50 ], [ 0, %34 ]
  %39 = add nsw i32 %37, %21
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !11, !range !13
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %44, label %50

44:                                               ; preds = %36
  %45 = add nsw i32 %37, %33
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !11, !range !13
  %49 = icmp ne i8 %48, 0
  br label %50

50:                                               ; preds = %44, %36
  %51 = phi i1 [ true, %36 ], [ %49, %44 ]
  %52 = zext i1 %51 to i8
  store i8 %52, i8 addrspace(1)* %41, align 1, !tbaa !11
  %53 = add nuw nsw i32 %37, 1
  %54 = add i32 %38, 1
  %55 = icmp eq i32 %54, %22
  br i1 %55, label %56, label %36, !llvm.loop !14

56:                                               ; preds = %34, %50, %26
  %57 = add nuw nsw i32 %27, 1
  %58 = icmp eq i32 %57, %4
  br i1 %58, label %124, label %26, !llvm.loop !16

59:                                               ; preds = %28, %118
  %60 = phi i32 [ %121, %118 ], [ 0, %28 ]
  %61 = phi i32 [ %122, %118 ], [ 0, %28 ]
  %62 = add nsw i32 %60, %21
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !11, !range !13
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %67, label %73

67:                                               ; preds = %59
  %68 = add nsw i32 %60, %33
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !11, !range !13
  %72 = icmp ne i8 %71, 0
  br label %73

73:                                               ; preds = %67, %59
  %74 = phi i1 [ true, %59 ], [ %72, %67 ]
  %75 = zext i1 %74 to i8
  store i8 %75, i8 addrspace(1)* %64, align 1, !tbaa !11
  %76 = or i32 %60, 1
  %77 = add nsw i32 %76, %21
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !11, !range !13
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %82, label %88

82:                                               ; preds = %73
  %83 = add nsw i32 %76, %33
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !11, !range !13
  %87 = icmp ne i8 %86, 0
  br label %88

88:                                               ; preds = %82, %73
  %89 = phi i1 [ true, %73 ], [ %87, %82 ]
  %90 = zext i1 %89 to i8
  store i8 %90, i8 addrspace(1)* %79, align 1, !tbaa !11
  %91 = or i32 %60, 2
  %92 = add nsw i32 %91, %21
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %93
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !11, !range !13
  %96 = icmp eq i8 %95, 0
  br i1 %96, label %97, label %103

97:                                               ; preds = %88
  %98 = add nsw i32 %91, %33
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %99
  %101 = load i8, i8 addrspace(1)* %100, align 1, !tbaa !11, !range !13
  %102 = icmp ne i8 %101, 0
  br label %103

103:                                              ; preds = %97, %88
  %104 = phi i1 [ true, %88 ], [ %102, %97 ]
  %105 = zext i1 %104 to i8
  store i8 %105, i8 addrspace(1)* %94, align 1, !tbaa !11
  %106 = or i32 %60, 3
  %107 = add nsw i32 %106, %21
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %108
  %110 = load i8, i8 addrspace(1)* %109, align 1, !tbaa !11, !range !13
  %111 = icmp eq i8 %110, 0
  br i1 %111, label %112, label %118

112:                                              ; preds = %103
  %113 = add nsw i32 %106, %33
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %114
  %116 = load i8, i8 addrspace(1)* %115, align 1, !tbaa !11, !range !13
  %117 = icmp ne i8 %116, 0
  br label %118

118:                                              ; preds = %112, %103
  %119 = phi i1 [ true, %103 ], [ %117, %112 ]
  %120 = zext i1 %119 to i8
  store i8 %120, i8 addrspace(1)* %109, align 1, !tbaa !11
  %121 = add nuw nsw i32 %60, 4
  %122 = add i32 %61, 4
  %123 = icmp eq i32 %122, %24
  br i1 %123, label %34, label %59, !llvm.loop !18

124:                                              ; preds = %56, %5
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
!11 = !{!12, !12, i64 0}
!12 = !{!"bool", !9, i64 0}
!13 = !{i8 0, i8 2}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
