; ModuleID = '../data/hip_kernels/763/59/main.cu'
source_filename = "../data/hip_kernels/763/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16writeLocalMemoryPfiiE4lbuf = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16writeLocalMemoryPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %69

14:                                               ; preds = %3
  %15 = sitofp i32 %12 to float
  br label %16

16:                                               ; preds = %14, %16
  %17 = phi i32 [ %4, %14 ], [ %66, %16 ]
  %18 = phi i32 [ 0, %14 ], [ %67, %16 ]
  %19 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %17
  store float %15, float addrspace(3)* %19, align 4, !tbaa !7
  %20 = add nuw nsw i32 %17, 1
  %21 = and i32 %20, 2047
  %22 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %21
  store float %15, float addrspace(3)* %22, align 4, !tbaa !7
  %23 = add nuw nsw i32 %17, 2
  %24 = and i32 %23, 2047
  %25 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %24
  store float %15, float addrspace(3)* %25, align 4, !tbaa !7
  %26 = add nuw nsw i32 %17, 3
  %27 = and i32 %26, 2047
  %28 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %27
  store float %15, float addrspace(3)* %28, align 4, !tbaa !7
  %29 = add nuw nsw i32 %17, 4
  %30 = and i32 %29, 2047
  %31 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %30
  store float %15, float addrspace(3)* %31, align 4, !tbaa !7
  %32 = add nuw nsw i32 %17, 5
  %33 = and i32 %32, 2047
  %34 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %33
  store float %15, float addrspace(3)* %34, align 4, !tbaa !7
  %35 = add nuw nsw i32 %17, 6
  %36 = and i32 %35, 2047
  %37 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %36
  store float %15, float addrspace(3)* %37, align 4, !tbaa !7
  %38 = add nuw nsw i32 %17, 7
  %39 = and i32 %38, 2047
  %40 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %39
  store float %15, float addrspace(3)* %40, align 4, !tbaa !7
  %41 = add nuw nsw i32 %17, 8
  %42 = and i32 %41, 2047
  %43 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %42
  store float %15, float addrspace(3)* %43, align 4, !tbaa !7
  %44 = add nuw nsw i32 %17, 9
  %45 = and i32 %44, 2047
  %46 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %45
  store float %15, float addrspace(3)* %46, align 4, !tbaa !7
  %47 = add nuw nsw i32 %17, 10
  %48 = and i32 %47, 2047
  %49 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %48
  store float %15, float addrspace(3)* %49, align 4, !tbaa !7
  %50 = add nuw nsw i32 %17, 11
  %51 = and i32 %50, 2047
  %52 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %51
  store float %15, float addrspace(3)* %52, align 4, !tbaa !7
  %53 = add nuw nsw i32 %17, 12
  %54 = and i32 %53, 2047
  %55 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %54
  store float %15, float addrspace(3)* %55, align 4, !tbaa !7
  %56 = add nuw nsw i32 %17, 13
  %57 = and i32 %56, 2047
  %58 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %57
  store float %15, float addrspace(3)* %58, align 4, !tbaa !7
  %59 = add nuw nsw i32 %17, 14
  %60 = and i32 %59, 2047
  %61 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %60
  store float %15, float addrspace(3)* %61, align 4, !tbaa !7
  %62 = add nuw nsw i32 %17, 15
  %63 = and i32 %62, 2047
  %64 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %63
  store float %15, float addrspace(3)* %64, align 4, !tbaa !7
  %65 = add nuw nsw i32 %17, 16
  %66 = and i32 %65, 2047
  %67 = add nuw nsw i32 %18, 1
  %68 = icmp eq i32 %67, %2
  br i1 %68, label %69, label %16, !llvm.loop !11

69:                                               ; preds = %16, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ16writeLocalMemoryPfiiE4lbuf, i32 0, i32 %4
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = sext i32 %12 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float %71, float addrspace(1)* %73, align 4, !tbaa !7
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
