; ModuleID = '../data/hip_kernels/9206/28/main.cu'
source_filename = "../data/hip_kernels/9206/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15ReduceRowMajor5PiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %11
  store i32 0, i32 addrspace(3)* %13, align 4, !tbaa !7
  %14 = icmp ult i32 %12, %2
  br i1 %14, label %15, label %19

15:                                               ; preds = %3
  %16 = zext i32 %12 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %18, i32 addrspace(3)* %13, align 4, !tbaa !7
  br label %19

19:                                               ; preds = %15, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp ugt i16 %8, 63
  br i1 %20, label %23, label %21

21:                                               ; preds = %33, %19
  %22 = icmp ult i32 %11, 32
  br i1 %22, label %35, label %75

23:                                               ; preds = %19, %33
  %24 = phi i32 [ %25, %33 ], [ %9, %19 ]
  %25 = lshr i32 %24, 1
  %26 = icmp ult i32 %11, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = add nuw nsw i32 %25, %11
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %28
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  %31 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !7
  %32 = add nsw i32 %31, %30
  store i32 %32, i32 addrspace(3)* %13, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %27, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ugt i32 %24, 127
  br i1 %34, label %23, label %21, !llvm.loop !11

35:                                               ; preds = %21
  %36 = add nuw nsw i32 %11, 32
  %37 = icmp slt i32 %36, %2
  br i1 %37, label %38, label %45

38:                                               ; preds = %35
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %36
  %40 = addrspacecast i32 addrspace(3)* %39 to i32*
  %41 = load volatile i32, i32* %40, align 4, !tbaa !7
  %42 = addrspacecast i32 addrspace(3)* %13 to i32*
  %43 = load volatile i32, i32* %42, align 4, !tbaa !7
  %44 = add nsw i32 %43, %41
  store volatile i32 %44, i32* %42, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %38, %35
  %46 = add nuw nsw i32 %11, 16
  %47 = icmp slt i32 %46, %2
  br i1 %47, label %48, label %55

48:                                               ; preds = %45
  %49 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %46
  %50 = addrspacecast i32 addrspace(3)* %49 to i32*
  %51 = load volatile i32, i32* %50, align 4, !tbaa !7
  %52 = addrspacecast i32 addrspace(3)* %13 to i32*
  %53 = load volatile i32, i32* %52, align 4, !tbaa !7
  %54 = add nsw i32 %53, %51
  store volatile i32 %54, i32* %52, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %48, %45
  %56 = add nuw nsw i32 %11, 8
  %57 = icmp slt i32 %56, %2
  br i1 %57, label %58, label %65

58:                                               ; preds = %55
  %59 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %56
  %60 = addrspacecast i32 addrspace(3)* %59 to i32*
  %61 = load volatile i32, i32* %60, align 4, !tbaa !7
  %62 = addrspacecast i32 addrspace(3)* %13 to i32*
  %63 = load volatile i32, i32* %62, align 4, !tbaa !7
  %64 = add nsw i32 %63, %61
  store volatile i32 %64, i32* %62, align 4, !tbaa !7
  br label %65

65:                                               ; preds = %58, %55
  %66 = add nuw nsw i32 %11, 4
  %67 = icmp slt i32 %66, %2
  br i1 %67, label %68, label %75

68:                                               ; preds = %65
  %69 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %66
  %70 = addrspacecast i32 addrspace(3)* %69 to i32*
  %71 = load volatile i32, i32* %70, align 4, !tbaa !7
  %72 = addrspacecast i32 addrspace(3)* %13 to i32*
  %73 = load volatile i32, i32* %72, align 4, !tbaa !7
  %74 = add nsw i32 %73, %71
  store volatile i32 %74, i32* %72, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %68, %65, %21
  %76 = icmp eq i32 %11, 0
  br i1 %76, label %77, label %94

77:                                               ; preds = %75
  %78 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %79 = shl i32 %4, 2
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  store i32 %78, i32 addrspace(1)* %81, align 4, !tbaa !7
  %82 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 1), align 4, !tbaa !7
  %83 = add nuw nsw i32 %79, 1
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %84
  store i32 %82, i32 addrspace(1)* %85, align 4, !tbaa !7
  %86 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 2), align 4, !tbaa !7
  %87 = add nuw nsw i32 %79, 2
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %88
  store i32 %86, i32 addrspace(1)* %89, align 4, !tbaa !7
  %90 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 3), align 4, !tbaa !7
  %91 = add nuw nsw i32 %79, 3
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %92
  store i32 %90, i32 addrspace(1)* %93, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %77, %75
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
