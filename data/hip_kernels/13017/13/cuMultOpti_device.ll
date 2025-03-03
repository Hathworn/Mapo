; ModuleID = '../data/hip_kernels/13017/13/main.cu'
source_filename = "../data/hip_kernels/13017/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10cuMultOptiPiS_S_iiiE6aBlock = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ10cuMultOptiPiS_S_iiiE6bBlock = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10cuMultOptiPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %3
  %25 = add i32 %24, %14
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %14, i32 %22
  store i32 %28, i32 addrspace(3)* %29, align 4, !tbaa !7
  %30 = mul i32 %22, %4
  %31 = add i32 %15, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %14, i32 %22
  store i32 %34, i32 addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp slt i32 %15, %4
  %37 = icmp slt i32 %23, %5
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %132

39:                                               ; preds = %6
  %40 = icmp sgt i32 %3, 0
  br i1 %40, label %41, label %64

41:                                               ; preds = %39
  %42 = and i32 %3, 7
  %43 = icmp ult i32 %3, 8
  br i1 %43, label %46, label %44

44:                                               ; preds = %41
  %45 = and i32 %3, -8
  br label %70

46:                                               ; preds = %70, %41
  %47 = phi i32 [ undef, %41 ], [ %128, %70 ]
  %48 = phi i32 [ 0, %41 ], [ %129, %70 ]
  %49 = phi i32 [ 0, %41 ], [ %128, %70 ]
  %50 = icmp eq i32 %42, 0
  br i1 %50, label %64, label %51

51:                                               ; preds = %46, %51
  %52 = phi i32 [ %61, %51 ], [ %48, %46 ]
  %53 = phi i32 [ %60, %51 ], [ %49, %46 ]
  %54 = phi i32 [ %62, %51 ], [ 0, %46 ]
  %55 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %52
  %56 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !7
  %57 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %52, i32 %14
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = mul nsw i32 %58, %56
  %60 = add nsw i32 %59, %53
  %61 = add nuw nsw i32 %52, 1
  %62 = add i32 %54, 1
  %63 = icmp eq i32 %62, %42
  br i1 %63, label %64, label %51, !llvm.loop !11

64:                                               ; preds = %46, %51, %39
  %65 = phi i32 [ 0, %39 ], [ %47, %46 ], [ %60, %51 ]
  %66 = mul nsw i32 %23, %4
  %67 = add nsw i32 %66, %15
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  store i32 %65, i32 addrspace(1)* %69, align 4, !tbaa !7
  br label %132

70:                                               ; preds = %70, %44
  %71 = phi i32 [ 0, %44 ], [ %129, %70 ]
  %72 = phi i32 [ 0, %44 ], [ %128, %70 ]
  %73 = phi i32 [ 0, %44 ], [ %130, %70 ]
  %74 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %71
  %75 = load i32, i32 addrspace(3)* %74, align 16, !tbaa !7
  %76 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %71, i32 %14
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %78 = mul nsw i32 %77, %75
  %79 = add nsw i32 %78, %72
  %80 = or i32 %71, 1
  %81 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %80
  %82 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !7
  %83 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %80, i32 %14
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  %85 = mul nsw i32 %84, %82
  %86 = add nsw i32 %85, %79
  %87 = or i32 %71, 2
  %88 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %87
  %89 = load i32, i32 addrspace(3)* %88, align 8, !tbaa !7
  %90 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %87, i32 %14
  %91 = load i32, i32 addrspace(3)* %90, align 4, !tbaa !7
  %92 = mul nsw i32 %91, %89
  %93 = add nsw i32 %92, %86
  %94 = or i32 %71, 3
  %95 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %94
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !7
  %97 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %94, i32 %14
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !7
  %99 = mul nsw i32 %98, %96
  %100 = add nsw i32 %99, %93
  %101 = or i32 %71, 4
  %102 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %101
  %103 = load i32, i32 addrspace(3)* %102, align 16, !tbaa !7
  %104 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %101, i32 %14
  %105 = load i32, i32 addrspace(3)* %104, align 4, !tbaa !7
  %106 = mul nsw i32 %105, %103
  %107 = add nsw i32 %106, %100
  %108 = or i32 %71, 5
  %109 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %108
  %110 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !7
  %111 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %108, i32 %14
  %112 = load i32, i32 addrspace(3)* %111, align 4, !tbaa !7
  %113 = mul nsw i32 %112, %110
  %114 = add nsw i32 %113, %107
  %115 = or i32 %71, 6
  %116 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %115
  %117 = load i32, i32 addrspace(3)* %116, align 8, !tbaa !7
  %118 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %115, i32 %14
  %119 = load i32, i32 addrspace(3)* %118, align 4, !tbaa !7
  %120 = mul nsw i32 %119, %117
  %121 = add nsw i32 %120, %114
  %122 = or i32 %71, 7
  %123 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6aBlock, i32 0, i32 %22, i32 %122
  %124 = load i32, i32 addrspace(3)* %123, align 4, !tbaa !7
  %125 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ10cuMultOptiPiS_S_iiiE6bBlock, i32 0, i32 %122, i32 %14
  %126 = load i32, i32 addrspace(3)* %125, align 4, !tbaa !7
  %127 = mul nsw i32 %126, %124
  %128 = add nsw i32 %127, %121
  %129 = add nuw nsw i32 %71, 8
  %130 = add i32 %73, 8
  %131 = icmp eq i32 %130, %45
  br i1 %131, label %46, label %70, !llvm.loop !13

132:                                              ; preds = %64, %6
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
