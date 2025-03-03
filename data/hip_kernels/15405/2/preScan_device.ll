; ModuleID = '../data/hip_kernels/15405/2/main.cu'
source_filename = "../data/hip_kernels/15405/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7preScanPjS_iS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl nuw nsw i32 %9, 1
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = shl nuw nsw i32 %13, 1
  %16 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %15
  store i32 0, i32 addrspace(3)* %16, align 4, !tbaa !7
  %17 = add nuw nsw i32 %15, 1
  %18 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %17
  store i32 0, i32 addrspace(3)* %18, align 4, !tbaa !7
  %19 = icmp slt i32 %14, %2
  br i1 %19, label %20, label %25

20:                                               ; preds = %4
  %21 = sext i32 %14 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %13
  store i32 %23, i32 addrspace(3)* %24, align 4, !tbaa !7
  br label %25

25:                                               ; preds = %20, %4
  %26 = add i32 %14, %9
  %27 = icmp ult i32 %26, %2
  br i1 %27, label %28, label %34

28:                                               ; preds = %25
  %29 = zext i32 %26 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = add nuw nsw i32 %13, %9
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %32
  store i32 %31, i32 addrspace(3)* %33, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %25, %28
  br label %37

35:                                               ; preds = %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp eq i32 %13, 0
  br i1 %36, label %55, label %61

37:                                               ; preds = %34, %51
  %38 = phi i32 [ %53, %51 ], [ %9, %34 ]
  %39 = phi i32 [ %52, %51 ], [ 1, %34 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i32 %13, %38
  br i1 %40, label %41, label %51

41:                                               ; preds = %37
  %42 = add nsw i32 %39, -1
  %43 = mul i32 %39, %15
  %44 = add i32 %42, %43
  %45 = add nsw i32 %44, %39
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %44
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %45
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add i32 %49, %47
  store i32 %50, i32 addrspace(3)* %48, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %41, %37
  %52 = shl nsw i32 %39, 1
  %53 = lshr i32 %38, 1
  %54 = icmp ugt i32 %38, 1
  br i1 %54, label %37, label %35, !llvm.loop !11

55:                                               ; preds = %35
  %56 = add nsw i32 %11, -1
  %57 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = zext i32 %10 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %59
  store i32 %58, i32 addrspace(1)* %60, align 4, !tbaa !7
  store i32 0, i32 addrspace(3)* %57, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %35, %55
  br label %63

62:                                               ; preds = %78
  br i1 %19, label %81, label %86

63:                                               ; preds = %61, %78
  %64 = phi i32 [ %66, %78 ], [ %52, %61 ]
  %65 = phi i32 [ %79, %78 ], [ 1, %61 ]
  %66 = lshr i32 %64, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = icmp ult i32 %13, %65
  br i1 %67, label %68, label %78

68:                                               ; preds = %63
  %69 = add nsw i32 %66, -1
  %70 = mul i32 %66, %15
  %71 = add i32 %69, %70
  %72 = add nsw i32 %71, %66
  %73 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %71
  %76 = load i32, i32 addrspace(3)* %75, align 4, !tbaa !7
  %77 = add i32 %76, %74
  store i32 %77, i32 addrspace(3)* %73, align 4, !tbaa !7
  store i32 %74, i32 addrspace(3)* %75, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %63, %68
  %79 = shl nsw i32 %65, 1
  %80 = icmp slt i32 %79, %11
  br i1 %80, label %63, label %62, !llvm.loop !13

81:                                               ; preds = %62
  %82 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %13
  %83 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !7
  %84 = sext i32 %14 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %84
  store i32 %83, i32 addrspace(1)* %85, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %81, %62
  br i1 %27, label %87, label %93

87:                                               ; preds = %86
  %88 = add nuw nsw i32 %13, %9
  %89 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %88
  %90 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !7
  %91 = zext i32 %26 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  store i32 %90, i32 addrspace(1)* %92, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %87, %86
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
