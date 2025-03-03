; ModuleID = '../data/hip_kernels/12841/1/main.cu'
source_filename = "../data/hip_kernels/12841/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.Vec3f = type { [3 x float] }

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x %struct.Vec3f], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6reduceP5Vec3fS0_(%struct.Vec3f addrspace(1)* nocapture readonly %0, %struct.Vec3f addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds %struct.Vec3f, %struct.Vec3f addrspace(1)* %0, i64 %12
  %14 = getelementptr inbounds [0 x %struct.Vec3f], [0 x %struct.Vec3f] addrspace(3)* @sdata, i32 0, i32 %3
  %15 = bitcast %struct.Vec3f addrspace(3)* %14 to i8 addrspace(3)*
  %16 = bitcast %struct.Vec3f addrspace(1)* %13 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 4 dereferenceable(12) %15, i8 addrspace(1)* noundef align 4 dereferenceable(12) %16, i64 12, i1 false), !tbaa.struct !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp ugt i16 %8, 1
  br i1 %17, label %18, label %22

18:                                               ; preds = %2
  %19 = getelementptr inbounds %struct.Vec3f, %struct.Vec3f addrspace(3)* %14, i32 0, i32 0, i32 0
  %20 = getelementptr inbounds [0 x %struct.Vec3f], [0 x %struct.Vec3f] addrspace(3)* @sdata, i32 0, i32 %3, i32 0, i32 1
  %21 = getelementptr inbounds [0 x %struct.Vec3f], [0 x %struct.Vec3f] addrspace(3)* @sdata, i32 0, i32 %3, i32 0, i32 2
  br label %24

22:                                               ; preds = %44, %2
  %23 = icmp eq i32 %3, 0
  br i1 %23, label %46, label %50

24:                                               ; preds = %18, %44
  %25 = phi i32 [ 1, %18 ], [ %26, %44 ]
  %26 = shl i32 %25, 1
  %27 = add i32 %26, 1023
  %28 = and i32 %27, %3
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %44

30:                                               ; preds = %24
  %31 = add i32 %25, %3
  %32 = getelementptr inbounds [0 x %struct.Vec3f], [0 x %struct.Vec3f] addrspace(3)* @sdata, i32 0, i32 %31, i32 0, i32 0
  %33 = load float, float addrspace(3)* %32, align 4, !tbaa !11
  %34 = load float, float addrspace(3)* %19, align 4, !tbaa !11
  %35 = fadd contract float %33, %34
  store float %35, float addrspace(3)* %19, align 4, !tbaa !11
  %36 = getelementptr inbounds [0 x %struct.Vec3f], [0 x %struct.Vec3f] addrspace(3)* @sdata, i32 0, i32 %31, i32 0, i32 1
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !11
  %38 = load float, float addrspace(3)* %20, align 4, !tbaa !11
  %39 = fadd contract float %37, %38
  store float %39, float addrspace(3)* %20, align 4, !tbaa !11
  %40 = getelementptr inbounds [0 x %struct.Vec3f], [0 x %struct.Vec3f] addrspace(3)* @sdata, i32 0, i32 %31, i32 0, i32 2
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !11
  %42 = load float, float addrspace(3)* %21, align 4, !tbaa !11
  %43 = fadd contract float %41, %42
  store float %43, float addrspace(3)* %21, align 4, !tbaa !11
  br label %44

44:                                               ; preds = %30, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ult i32 %26, %9
  br i1 %45, label %24, label %22, !llvm.loop !13

46:                                               ; preds = %22
  %47 = zext i32 %4 to i64
  %48 = getelementptr inbounds %struct.Vec3f, %struct.Vec3f addrspace(1)* %1, i64 %47
  %49 = bitcast %struct.Vec3f addrspace(1)* %48 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p3i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %49, i8 addrspace(3)* noundef align 4 dereferenceable(12) bitcast ([0 x %struct.Vec3f] addrspace(3)* @sdata to i8 addrspace(3)*), i64 12, i1 false), !tbaa.struct !7
  br label %50

50:                                               ; preds = %46, %22
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

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p3i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(3)* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

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
!7 = !{i64 0, i64 12, !8}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
