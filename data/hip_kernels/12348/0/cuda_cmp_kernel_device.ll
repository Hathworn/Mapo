; ModuleID = '../data/hip_kernels/12348/0/main.cu'
source_filename = "../data/hip_kernels/12348/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__scratch_lds = internal addrspace(3) global [32 x i64] undef, align 8

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15cuda_cmp_kernelmPiS_S_(i64 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = sext i32 %13 to i64
  %15 = icmp ult i64 %14, %0
  br i1 %15, label %16, label %23

16:                                               ; preds = %4
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = icmp slt i32 %18, %20
  %22 = zext i1 %21 to i32
  br label %23

23:                                               ; preds = %4, %16
  %24 = phi i32 [ %22, %16 ], [ 0, %4 ]
  %25 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !5, !invariant.load !6
  %32 = zext i16 %31 to i32
  %33 = mul nuw nsw i32 %28, %11
  %34 = mul nuw nsw i32 %33, %32
  %35 = add nuw nsw i32 %34, 63
  %36 = tail call i32 @llvm.amdgcn.update.dpp.i32(i32 undef, i32 %24, i32 257, i32 15, i32 15, i1 true)
  %37 = or i32 %36, %24
  %38 = tail call i32 @llvm.amdgcn.update.dpp.i32(i32 undef, i32 %37, i32 258, i32 15, i32 15, i1 true)
  %39 = or i32 %37, %38
  %40 = tail call i32 @llvm.amdgcn.update.dpp.i32(i32 undef, i32 %39, i32 260, i32 15, i32 15, i1 true)
  %41 = or i32 %39, %40
  %42 = tail call i32 @llvm.amdgcn.update.dpp.i32(i32 undef, i32 %41, i32 264, i32 15, i32 15, i1 true)
  %43 = or i32 %41, %42
  %44 = tail call i32 @llvm.amdgcn.update.dpp.i32(i32 undef, i32 %43, i32 304, i32 15, i32 15, i1 true)
  %45 = tail call i32 @llvm.amdgcn.update.dpp.i32(i32 undef, i32 %44, i32 320, i32 15, i32 15, i1 true)
  %46 = or i32 %45, %43
  %47 = tail call i32 @llvm.amdgcn.readlane(i32 %46, i32 32)
  %48 = tail call i32 @llvm.read_register.i32(metadata !11) #6
  %49 = and i32 %48, 1
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 0, i32 %47
  %52 = tail call i32 @llvm.amdgcn.readlane(i32 %46, i32 0)
  %53 = or i32 %51, %52
  %54 = and i32 %35, 2147483584
  %55 = icmp eq i32 %54, 64
  br i1 %55, label %77, label %56

56:                                               ; preds = %23
  %57 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %58 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %57)
  %59 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %60 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %61 = mul nuw nsw i32 %60, %32
  %62 = add nuw nsw i32 %61, %59
  %63 = mul nuw nsw i32 %62, %11
  %64 = add nuw nsw i32 %63, %5
  %65 = lshr i32 %64, 6
  %66 = icmp eq i32 %58, 0
  %67 = or i32 %58, %65
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %70

69:                                               ; preds = %56
  store atomic i32 %53, i32 addrspace(3)* bitcast ([32 x i64] addrspace(3)* @__scratch_lds to i32 addrspace(3)*) syncscope("workgroup-one-as") monotonic, align 8
  br label %70

70:                                               ; preds = %69, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp ugt i32 %64, 63
  %72 = and i1 %71, %66
  br i1 %72, label %73, label %75

73:                                               ; preds = %70
  %74 = atomicrmw or i32 addrspace(3)* bitcast ([32 x i64] addrspace(3)* @__scratch_lds to i32 addrspace(3)*), i32 %53 syncscope("workgroup-one-as") monotonic, align 4
  br label %75

75:                                               ; preds = %73, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = load atomic i32, i32 addrspace(3)* bitcast ([32 x i64] addrspace(3)* @__scratch_lds to i32 addrspace(3)*) syncscope("workgroup-one-as") monotonic, align 8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %77

77:                                               ; preds = %23, %75
  %78 = phi i32 [ %76, %75 ], [ %53, %23 ]
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %81, label %80

80:                                               ; preds = %77
  store i32 1, i32 addrspace(1)* %3, align 4, !tbaa !7
  br label %81

81:                                               ; preds = %80, %77
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #3

; Function Attrs: nofree nounwind readonly
declare i32 @llvm.read_register.i32(metadata) #4

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readlane(i32, i32) #5

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.update.dpp.i32(i32, i32, i32 immarg, i32 immarg, i32 immarg, i1 immarg) #5

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { convergent mustprogress nounwind willreturn }
attributes #4 = { nofree nounwind readonly }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { convergent }

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
!11 = !{!"exec_hi"}
