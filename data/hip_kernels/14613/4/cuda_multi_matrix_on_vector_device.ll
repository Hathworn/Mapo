; ModuleID = '../data/hip_kernels/14613/4/main.cu'
source_filename = "../data/hip_kernels/14613/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27cuda_multi_matrix_on_vectorPiS_S_iE5cache = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27cuda_multi_matrix_on_vectorPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %3, 0
  br i1 %14, label %15, label %22

15:                                               ; preds = %4
  %16 = add nuw nsw i32 %3, 511
  %17 = lshr i32 %16, 9
  %18 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ27cuda_multi_matrix_on_vectorPiS_S_iE5cache, i32 0, i32 %12
  %19 = icmp slt i32 %13, %3
  %20 = sext i32 %13 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %20
  br label %23

22:                                               ; preds = %117, %4
  ret void

23:                                               ; preds = %15, %117
  %24 = phi i32 [ 0, %15 ], [ %118, %117 ]
  %25 = shl i32 %24, 9
  %26 = sub i32 %3, %25
  %27 = tail call i32 @llvm.smin.i32(i32 %26, i32 512)
  %28 = tail call i32 @llvm.smax.i32(i32 %27, i32 1)
  %29 = add nsw i32 %28, -1
  %30 = shl nsw i32 %24, 9
  %31 = add nuw nsw i32 %30, %12
  %32 = icmp slt i32 %31, %3
  br i1 %32, label %33, label %37

33:                                               ; preds = %23
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %36, i32 addrspace(3)* %18, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %33, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp slt i32 %30, %3
  %39 = select i1 %19, i1 %38, i1 false
  br i1 %39, label %40, label %117

40:                                               ; preds = %37
  %41 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7
  %42 = and i32 %28, 3
  %43 = icmp ult i32 %29, 3
  br i1 %43, label %96, label %44

44:                                               ; preds = %40
  %45 = and i32 %28, 2147483644
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi i32 [ %41, %44 ], [ %92, %46 ]
  %48 = phi i32 [ 0, %44 ], [ %93, %46 ]
  %49 = phi i32 [ 0, %44 ], [ %94, %46 ]
  %50 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ27cuda_multi_matrix_on_vectorPiS_S_iE5cache, i32 0, i32 %48
  %51 = load i32, i32 addrspace(3)* %50, align 16, !tbaa !7
  %52 = add nuw nsw i32 %48, %30
  %53 = mul nsw i32 %52, %3
  %54 = add nsw i32 %53, %13
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7
  %58 = mul nsw i32 %57, %51
  %59 = add nsw i32 %47, %58
  store i32 %59, i32 addrspace(1)* %21, align 4, !tbaa !7
  %60 = or i32 %48, 1
  %61 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ27cuda_multi_matrix_on_vectorPiS_S_iE5cache, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !7
  %63 = add nuw nsw i32 %60, %30
  %64 = mul nsw i32 %63, %3
  %65 = add nsw i32 %64, %13
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7
  %69 = mul nsw i32 %68, %62
  %70 = add nsw i32 %59, %69
  store i32 %70, i32 addrspace(1)* %21, align 4, !tbaa !7
  %71 = or i32 %48, 2
  %72 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ27cuda_multi_matrix_on_vectorPiS_S_iE5cache, i32 0, i32 %71
  %73 = load i32, i32 addrspace(3)* %72, align 8, !tbaa !7
  %74 = add nuw nsw i32 %71, %30
  %75 = mul nsw i32 %74, %3
  %76 = add nsw i32 %75, %13
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7
  %80 = mul nsw i32 %79, %73
  %81 = add nsw i32 %70, %80
  store i32 %81, i32 addrspace(1)* %21, align 4, !tbaa !7
  %82 = or i32 %48, 3
  %83 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ27cuda_multi_matrix_on_vectorPiS_S_iE5cache, i32 0, i32 %82
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  %85 = add nuw nsw i32 %82, %30
  %86 = mul nsw i32 %85, %3
  %87 = add nsw i32 %86, %13
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7
  %91 = mul nsw i32 %90, %84
  %92 = add nsw i32 %81, %91
  store i32 %92, i32 addrspace(1)* %21, align 4, !tbaa !7
  %93 = add nuw nsw i32 %48, 4
  %94 = add nuw i32 %49, 4
  %95 = icmp eq i32 %94, %45
  br i1 %95, label %96, label %46, !llvm.loop !11

96:                                               ; preds = %46, %40
  %97 = phi i32 [ %41, %40 ], [ %92, %46 ]
  %98 = phi i32 [ 0, %40 ], [ %93, %46 ]
  %99 = icmp eq i32 %42, 0
  br i1 %99, label %117, label %100

100:                                              ; preds = %96, %100
  %101 = phi i32 [ %113, %100 ], [ %97, %96 ]
  %102 = phi i32 [ %114, %100 ], [ %98, %96 ]
  %103 = phi i32 [ %115, %100 ], [ 0, %96 ]
  %104 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ27cuda_multi_matrix_on_vectorPiS_S_iE5cache, i32 0, i32 %102
  %105 = load i32, i32 addrspace(3)* %104, align 4, !tbaa !7
  %106 = add nuw nsw i32 %102, %30
  %107 = mul nsw i32 %106, %3
  %108 = add nsw i32 %107, %13
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7
  %112 = mul nsw i32 %111, %105
  %113 = add nsw i32 %101, %112
  store i32 %113, i32 addrspace(1)* %21, align 4, !tbaa !7
  %114 = add nuw nsw i32 %102, 1
  %115 = add i32 %103, 1
  %116 = icmp eq i32 %115, %42
  br i1 %116, label %117, label %100, !llvm.loop !13

117:                                              ; preds = %96, %100, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %118 = add nuw nsw i32 %24, 1
  %119 = icmp eq i32 %118, %17
  br i1 %119, label %22, label %23, !llvm.loop !15
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!15 = distinct !{!15, !12}
