; ModuleID = '../data/hip_kernels/1239/0/main.cu'
source_filename = "../data/hip_kernels/1239/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17stencil_no_sharedPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #1 {
  %3 = alloca [1030 x i32], align 16, addrspace(5)
  %4 = bitcast [1030 x i32] addrspace(5)* %3 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4120, i8 addrspace(5)* %4) #4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = add nuw nsw i32 %5, 3
  %15 = add nsw i32 %13, 3
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %14
  store i32 %18, i32 addrspace(5)* %19, align 4, !tbaa !7
  %20 = icmp ult i32 %5, 3
  %21 = sext i32 %13 to i64
  br i1 %20, label %22, label %32

22:                                               ; preds = %2
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %5
  store i32 %24, i32 addrspace(5)* %25, align 4, !tbaa !7
  %26 = add nsw i32 %13, 1027
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = add nuw nsw i32 %5, 1027
  %31 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %30
  store i32 %29, i32 addrspace(5)* %31, align 4, !tbaa !7
  br label %32

32:                                               ; preds = %2, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %5
  %34 = load i32, i32 addrspace(5)* %33, align 4, !tbaa !7
  %35 = add nuw nsw i32 %5, 1
  %36 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %35
  %37 = load i32, i32 addrspace(5)* %36, align 4, !tbaa !7
  %38 = add nsw i32 %37, %34
  %39 = add nuw nsw i32 %5, 2
  %40 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %39
  %41 = load i32, i32 addrspace(5)* %40, align 4, !tbaa !7
  %42 = add nsw i32 %41, %38
  %43 = load i32, i32 addrspace(5)* %19, align 4, !tbaa !7
  %44 = add nsw i32 %43, %42
  %45 = add nuw nsw i32 %5, 4
  %46 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %45
  %47 = load i32, i32 addrspace(5)* %46, align 4, !tbaa !7
  %48 = add nsw i32 %47, %44
  %49 = add nuw nsw i32 %5, 5
  %50 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %49
  %51 = load i32, i32 addrspace(5)* %50, align 4, !tbaa !7
  %52 = add nsw i32 %51, %48
  %53 = add nuw nsw i32 %5, 6
  %54 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(5)* %3, i32 0, i32 %53
  %55 = load i32, i32 addrspace(5)* %54, align 4, !tbaa !7
  %56 = add nsw i32 %55, %52
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %21
  store i32 %56, i32 addrspace(1)* %57, align 4, !tbaa !7
  call void @llvm.lifetime.end.p5i8(i64 4120, i8 addrspace(5)* %4) #4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

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
