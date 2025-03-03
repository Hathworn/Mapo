; ModuleID = '../data/hip_kernels/977/4/main.cu'
source_filename = "../data/hip_kernels/977/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce4PiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = shl i32 %4, 1
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %3
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = add i32 %12, %9
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = add nsw i32 %19, %15
  %21 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %3
  store i32 %20, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = icmp ugt i16 %8, 65
  br i1 %22, label %25, label %23

23:                                               ; preds = %35, %2
  %24 = icmp ult i32 %3, 32
  br i1 %24, label %37, label %75

25:                                               ; preds = %2, %35
  %26 = phi i32 [ %27, %35 ], [ %9, %2 ]
  %27 = lshr i32 %26, 1
  %28 = icmp ult i32 %3, %27
  br i1 %28, label %29, label %35

29:                                               ; preds = %25
  %30 = add nuw nsw i32 %27, %3
  %31 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %30
  %32 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !7
  %33 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %34 = add nsw i32 %33, %32
  store i32 %34, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %29, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp ugt i32 %26, 131
  br i1 %36, label %25, label %23, !llvm.loop !11

37:                                               ; preds = %23
  %38 = add nuw nsw i32 %3, 32
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %38
  %40 = addrspacecast i32 addrspace(3)* %39 to i32*
  %41 = load volatile i32, i32* %40, align 4, !tbaa !7
  %42 = addrspacecast i32 addrspace(3)* %21 to i32*
  %43 = load volatile i32, i32* %42, align 4, !tbaa !7
  %44 = add nsw i32 %43, %41
  store volatile i32 %44, i32* %42, align 4, !tbaa !7
  %45 = add nuw nsw i32 %3, 16
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %45
  %47 = addrspacecast i32 addrspace(3)* %46 to i32*
  %48 = load volatile i32, i32* %47, align 4, !tbaa !7
  %49 = load volatile i32, i32* %42, align 4, !tbaa !7
  %50 = add nsw i32 %49, %48
  store volatile i32 %50, i32* %42, align 4, !tbaa !7
  %51 = add nuw nsw i32 %3, 8
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %51
  %53 = addrspacecast i32 addrspace(3)* %52 to i32*
  %54 = load volatile i32, i32* %53, align 4, !tbaa !7
  %55 = load volatile i32, i32* %42, align 4, !tbaa !7
  %56 = add nsw i32 %55, %54
  store volatile i32 %56, i32* %42, align 4, !tbaa !7
  %57 = add nuw nsw i32 %3, 4
  %58 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %57
  %59 = addrspacecast i32 addrspace(3)* %58 to i32*
  %60 = load volatile i32, i32* %59, align 4, !tbaa !7
  %61 = load volatile i32, i32* %42, align 4, !tbaa !7
  %62 = add nsw i32 %61, %60
  store volatile i32 %62, i32* %42, align 4, !tbaa !7
  %63 = add nuw nsw i32 %3, 2
  %64 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %63
  %65 = addrspacecast i32 addrspace(3)* %64 to i32*
  %66 = load volatile i32, i32* %65, align 4, !tbaa !7
  %67 = load volatile i32, i32* %42, align 4, !tbaa !7
  %68 = add nsw i32 %67, %66
  store volatile i32 %68, i32* %42, align 4, !tbaa !7
  %69 = add nuw nsw i32 %3, 1
  %70 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %69
  %71 = addrspacecast i32 addrspace(3)* %70 to i32*
  %72 = load volatile i32, i32* %71, align 4, !tbaa !7
  %73 = load volatile i32, i32* %42, align 4, !tbaa !7
  %74 = add nsw i32 %73, %72
  store volatile i32 %74, i32* %42, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %37, %23
  %76 = icmp eq i32 %3, 0
  br i1 %76, label %77, label %81

77:                                               ; preds = %75
  %78 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %79 = zext i32 %4 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  store i32 %78, i32 addrspace(1)* %80, align 4, !tbaa !7
  br label %81

81:                                               ; preds = %77, %75
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
