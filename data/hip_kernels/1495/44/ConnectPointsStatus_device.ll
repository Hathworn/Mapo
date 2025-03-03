; ModuleID = '../data/hip_kernels/1495/44/main.cu'
source_filename = "../data/hip_kernels/1495/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL19ConnectPointsStatusPiS_iiii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL19ConnectPointsStatusPiS_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 comdat {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = freeze i32 %15
  %17 = mul i32 %4, %3
  %18 = mul i32 %17, %2
  %19 = icmp slt i32 %16, %18
  br i1 %19, label %20, label %118

20:                                               ; preds = %6
  %21 = srem i32 %16, %17
  %22 = freeze i32 %21
  %23 = freeze i32 %4
  %24 = sdiv i32 %22, %23
  %25 = mul i32 %24, %23
  %26 = sub i32 %22, %25
  %27 = srem i32 %16, %17
  %28 = sub nsw i32 %16, %27
  %29 = mul nsw i32 %24, %4
  %30 = add nsw i32 %29, %28
  %31 = add nsw i32 %30, %26
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = icmp eq i32 %34, -1
  br i1 %35, label %118, label %36

36:                                               ; preds = %20
  %37 = add nsw i32 %24, %5
  %38 = tail call i32 @llvm.smin.i32(i32 %37, i32 %3)
  %39 = add nsw i32 %24, 1
  %40 = icmp slt i32 %39, %38
  br i1 %40, label %41, label %118

41:                                               ; preds = %36
  %42 = icmp sgt i32 %4, 0
  %43 = mul nsw i32 %5, %5
  %44 = mul i32 %31, %5
  %45 = and i32 %4, 1
  %46 = icmp eq i32 %4, 1
  %47 = and i32 %4, -2
  %48 = icmp eq i32 %45, 0
  br label %70

49:                                               ; preds = %114, %72
  %50 = phi i32 [ 0, %72 ], [ %115, %114 ]
  br i1 %48, label %67, label %51

51:                                               ; preds = %49
  %52 = add nsw i32 %74, %50
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = icmp eq i32 %55, -1
  br i1 %56, label %67, label %57

57:                                               ; preds = %51
  %58 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %59 = sub nsw i32 %58, %55
  %60 = mul nsw i32 %59, %59
  %61 = add nuw nsw i32 %60, %76
  %62 = icmp ult i32 %61, %43
  br i1 %62, label %63, label %67

63:                                               ; preds = %57
  %64 = add nsw i32 %50, %78
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  store i32 %61, i32 addrspace(1)* %66, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %49, %63, %57, %51, %70
  %68 = add nsw i32 %71, 1
  %69 = icmp slt i32 %68, %38
  br i1 %69, label %70, label %118, !llvm.loop !11

70:                                               ; preds = %41, %67
  %71 = phi i32 [ %39, %41 ], [ %68, %67 ]
  br i1 %42, label %72, label %67

72:                                               ; preds = %70
  %73 = mul nsw i32 %71, %4
  %74 = add nsw i32 %73, %28
  %75 = sub nsw i32 %71, %24
  %76 = mul nsw i32 %75, %75
  %77 = add i32 %75, %44
  %78 = mul i32 %77, %4
  br i1 %46, label %49, label %79

79:                                               ; preds = %72, %114
  %80 = phi i32 [ %115, %114 ], [ 0, %72 ]
  %81 = phi i32 [ %116, %114 ], [ 0, %72 ]
  %82 = add nsw i32 %74, %80
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = icmp eq i32 %85, -1
  br i1 %86, label %97, label %87

87:                                               ; preds = %79
  %88 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %89 = sub nsw i32 %88, %85
  %90 = mul nsw i32 %89, %89
  %91 = add nuw nsw i32 %90, %76
  %92 = icmp ult i32 %91, %43
  br i1 %92, label %93, label %97

93:                                               ; preds = %87
  %94 = add nsw i32 %80, %78
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  store i32 %91, i32 addrspace(1)* %96, align 4, !tbaa !7
  br label %97

97:                                               ; preds = %87, %93, %79
  %98 = or i32 %80, 1
  %99 = add nsw i32 %74, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7
  %103 = icmp eq i32 %102, -1
  br i1 %103, label %114, label %104

104:                                              ; preds = %97
  %105 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %106 = sub nsw i32 %105, %102
  %107 = mul nsw i32 %106, %106
  %108 = add nuw nsw i32 %107, %76
  %109 = icmp ult i32 %108, %43
  br i1 %109, label %110, label %114

110:                                              ; preds = %104
  %111 = add nsw i32 %98, %78
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %112
  store i32 %108, i32 addrspace(1)* %113, align 4, !tbaa !7
  br label %114

114:                                              ; preds = %110, %104, %97
  %115 = add nuw nsw i32 %80, 2
  %116 = add i32 %81, 2
  %117 = icmp eq i32 %116, %47
  br i1 %117, label %49, label %79, !llvm.loop !13

118:                                              ; preds = %67, %36, %20, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
