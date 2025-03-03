; ModuleID = '../data/hip_kernels/977/5/main.cu'
source_filename = "../data/hip_kernels/977/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce5PiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
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
  %22 = icmp ult i32 %3, 128
  br i1 %22, label %23, label %29

23:                                               ; preds = %2
  %24 = add nuw nsw i32 %3, 128
  %25 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %24
  %26 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !7
  %27 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %28 = add nsw i32 %27, %26
  store i32 %28, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %23, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i32 %3, 64
  br i1 %30, label %31, label %37

31:                                               ; preds = %29
  %32 = add nuw nsw i32 %3, 64
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %32
  %34 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !7
  %35 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %36 = add nsw i32 %35, %34
  store i32 %36, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %31, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp ult i32 %3, 32
  br i1 %38, label %39, label %77

39:                                               ; preds = %37
  %40 = add nuw nsw i32 %3, 32
  %41 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %40
  %42 = addrspacecast i32 addrspace(3)* %41 to i32*
  %43 = load volatile i32, i32* %42, align 4, !tbaa !7
  %44 = addrspacecast i32 addrspace(3)* %21 to i32*
  %45 = load volatile i32, i32* %44, align 4, !tbaa !7
  %46 = add nsw i32 %45, %43
  store volatile i32 %46, i32* %44, align 4, !tbaa !7
  %47 = add nuw nsw i32 %3, 16
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %47
  %49 = addrspacecast i32 addrspace(3)* %48 to i32*
  %50 = load volatile i32, i32* %49, align 4, !tbaa !7
  %51 = load volatile i32, i32* %44, align 4, !tbaa !7
  %52 = add nsw i32 %51, %50
  store volatile i32 %52, i32* %44, align 4, !tbaa !7
  %53 = add nuw nsw i32 %3, 8
  %54 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %53
  %55 = addrspacecast i32 addrspace(3)* %54 to i32*
  %56 = load volatile i32, i32* %55, align 4, !tbaa !7
  %57 = load volatile i32, i32* %44, align 4, !tbaa !7
  %58 = add nsw i32 %57, %56
  store volatile i32 %58, i32* %44, align 4, !tbaa !7
  %59 = add nuw nsw i32 %3, 4
  %60 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %59
  %61 = addrspacecast i32 addrspace(3)* %60 to i32*
  %62 = load volatile i32, i32* %61, align 4, !tbaa !7
  %63 = load volatile i32, i32* %44, align 4, !tbaa !7
  %64 = add nsw i32 %63, %62
  store volatile i32 %64, i32* %44, align 4, !tbaa !7
  %65 = add nuw nsw i32 %3, 2
  %66 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %65
  %67 = addrspacecast i32 addrspace(3)* %66 to i32*
  %68 = load volatile i32, i32* %67, align 4, !tbaa !7
  %69 = load volatile i32, i32* %44, align 4, !tbaa !7
  %70 = add nsw i32 %69, %68
  store volatile i32 %70, i32* %44, align 4, !tbaa !7
  %71 = add nuw nsw i32 %3, 1
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %71
  %73 = addrspacecast i32 addrspace(3)* %72 to i32*
  %74 = load volatile i32, i32* %73, align 4, !tbaa !7
  %75 = load volatile i32, i32* %44, align 4, !tbaa !7
  %76 = add nsw i32 %75, %74
  store volatile i32 %76, i32* %44, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %39, %37
  %78 = icmp eq i32 %3, 0
  br i1 %78, label %79, label %83

79:                                               ; preds = %77
  %80 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %81 = zext i32 %4 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  store i32 %80, i32 addrspace(1)* %82, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %79, %77
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
