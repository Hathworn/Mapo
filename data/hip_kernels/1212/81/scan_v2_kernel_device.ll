; ModuleID = '../data/hip_kernels/1212/81/main.cu'
source_filename = "../data/hip_kernels/1212/81/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_buffer = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14scan_v2_kernelPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !5
  %16 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_buffer, i32 0, i32 %11
  store float %15, float addrspace(3)* %16, align 4, !tbaa !7
  %17 = add nsw i32 %12, 16
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = add nuw nsw i32 %11, 16
  %22 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_buffer, i32 0, i32 %21
  store float %20, float addrspace(3)* %22, align 4, !tbaa !7
  %23 = icmp sgt i32 %2, 1
  br i1 %23, label %24, label %28

24:                                               ; preds = %3
  %25 = shl nuw nsw i32 %11, 1
  %26 = add nuw nsw i32 %25, 1
  %27 = add nuw nsw i32 %25, 2
  br label %35

28:                                               ; preds = %50, %3
  %29 = phi i32 [ 1, %3 ], [ %51, %50 ]
  %30 = icmp sgt i32 %29, 1
  br i1 %30, label %31, label %71

31:                                               ; preds = %28
  %32 = shl nuw nsw i32 %11, 1
  %33 = add nuw nsw i32 %32, 2
  %34 = add nuw nsw i32 %32, 3
  br label %53

35:                                               ; preds = %24, %50
  %36 = phi i32 [ 1, %24 ], [ %51, %50 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = mul nsw i32 %36, %26
  %38 = mul nsw i32 %36, %27
  %39 = icmp sgt i32 %37, 0
  %40 = icmp slt i32 %38, 33
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %50

42:                                               ; preds = %35
  %43 = add nsw i32 %38, -1
  %44 = add nsw i32 %37, -1
  %45 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_buffer, i32 0, i32 %44
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %47 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_buffer, i32 0, i32 %43
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %49 = fadd contract float %46, %48
  store float %49, float addrspace(3)* %47, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %42, %35
  %51 = shl i32 %36, 1
  %52 = icmp slt i32 %51, %2
  br i1 %52, label %35, label %28, !llvm.loop !11

53:                                               ; preds = %31, %69
  %54 = phi i32 [ %29, %31 ], [ %55, %69 ]
  %55 = ashr i32 %54, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = mul nsw i32 %55, %33
  %57 = mul nsw i32 %55, %34
  %58 = icmp sgt i32 %56, 0
  %59 = icmp slt i32 %57, 33
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %60, label %61, label %69

61:                                               ; preds = %53
  %62 = add nsw i32 %57, -1
  %63 = add nsw i32 %56, -1
  %64 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_buffer, i32 0, i32 %63
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %66 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_buffer, i32 0, i32 %62
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %68 = fadd contract float %65, %67
  store float %68, float addrspace(3)* %66, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %61, %53
  %70 = icmp sgt i32 %54, 3
  br i1 %70, label %53, label %71, !llvm.loop !13

71:                                               ; preds = %69, %28
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = load float, float addrspace(3)* %16, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  store float %72, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  store float %74, float addrspace(1)* %75, align 4, !tbaa !7
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
