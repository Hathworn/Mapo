; ModuleID = '../data/hip_kernels/640/1/main.cu'
source_filename = "../data/hip_kernels/640/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@blkData = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8scanBlksPjS_jS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 addrspace(1)* writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 1
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = add i32 %14, %11
  %16 = icmp ult i32 %14, %2
  br i1 %16, label %17, label %22

17:                                               ; preds = %4
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %13
  store i32 %20, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %22

22:                                               ; preds = %17, %4
  %23 = icmp ult i32 %15, %2
  br i1 %23, label %24, label %30

24:                                               ; preds = %22
  %25 = sext i32 %15 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = add nuw nsw i32 %13, %11
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %28
  store i32 %27, i32 addrspace(3)* %29, align 4, !tbaa !7
  br label %30

30:                                               ; preds = %24, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = shl nuw nsw i32 %11, 1
  %32 = shl nuw nsw i32 %13, 1
  %33 = add nuw nsw i32 %32, 2
  br label %39

34:                                               ; preds = %51
  %35 = icmp ult i16 %10, 2
  br i1 %35, label %54, label %36

36:                                               ; preds = %34
  %37 = shl nuw nsw i32 %13, 1
  %38 = add nuw nsw i32 %37, 2
  br label %55

39:                                               ; preds = %30, %51
  %40 = phi i32 [ 1, %30 ], [ %52, %51 ]
  %41 = mul i32 %40, %33
  %42 = add i32 %41, -1
  %43 = icmp ult i32 %42, %31
  br i1 %43, label %44, label %51

44:                                               ; preds = %39
  %45 = sub nsw i32 %42, %40
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %42
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %49, %47
  store i32 %50, i32 addrspace(3)* %48, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %44, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = shl nsw i32 %40, 1
  %53 = icmp ult i32 %52, %31
  br i1 %53, label %39, label %34, !llvm.loop !11

54:                                               ; preds = %68, %34
  br i1 %16, label %70, label %75

55:                                               ; preds = %36, %68
  %56 = phi i32 [ %11, %36 ], [ %57, %68 ]
  %57 = lshr i32 %56, 1
  %58 = mul nuw nsw i32 %57, %38
  %59 = add nsw i32 %58, -1
  %60 = add nsw i32 %59, %57
  %61 = icmp ult i32 %60, %31
  br i1 %61, label %62, label %68

62:                                               ; preds = %55
  %63 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %59
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !7
  %65 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %60
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !7
  %67 = add nsw i32 %66, %64
  store i32 %67, i32 addrspace(3)* %65, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %62, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = icmp ult i32 %56, 4
  br i1 %69, label %54, label %55, !llvm.loop !13

70:                                               ; preds = %54
  %71 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %13
  %72 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !7
  %73 = sext i32 %14 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  store i32 %72, i32 addrspace(1)* %74, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %70, %54
  br i1 %23, label %76, label %82

76:                                               ; preds = %75
  %77 = add nuw nsw i32 %13, %11
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %77
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !7
  %80 = sext i32 %15 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  store i32 %79, i32 addrspace(1)* %81, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %76, %75
  %83 = icmp ne i32 addrspace(1)* %3, addrspacecast (i32* null to i32 addrspace(1)*)
  %84 = icmp eq i32 %13, 0
  %85 = select i1 %83, i1 %84, i1 false
  br i1 %85, label %86, label %92

86:                                               ; preds = %82
  %87 = add nsw i32 %31, -1
  %88 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @blkData, i32 0, i32 %87
  %89 = load i32, i32 addrspace(3)* %88, align 4, !tbaa !7
  %90 = zext i32 %5 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %90
  store i32 %89, i32 addrspace(1)* %91, align 4, !tbaa !7
  br label %92

92:                                               ; preds = %86, %82
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
