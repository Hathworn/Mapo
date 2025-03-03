; ModuleID = '../data/hip_kernels/13765/6/main.cu'
source_filename = "../data/hip_kernels/13765/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11update_binsPjPiiiE4temp = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11update_binsPjPiii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul nuw nsw i32 %15, %11
  %17 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %5
  store i32 0, i32 addrspace(3)* %17, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp slt i32 %5, %3
  br i1 %18, label %19, label %33

19:                                               ; preds = %4, %28
  %20 = phi i32 [ %30, %28 ], [ %5, %4 ]
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = icmp eq i32 %23, %6
  br i1 %24, label %25, label %28

25:                                               ; preds = %19
  %26 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %27 = add i32 %26, 1
  store i32 %27, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %28

28:                                               ; preds = %25, %19
  %29 = icmp ule i32 %23, %6
  %30 = add nuw nsw i32 %20, %16
  %31 = icmp slt i32 %30, %3
  %32 = select i1 %29, i1 %31, i1 false
  br i1 %32, label %19, label %33, !llvm.loop !11

33:                                               ; preds = %28, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp eq i32 %5, 0
  %35 = icmp sgt i32 %2, 0
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %100

37:                                               ; preds = %33
  %38 = zext i32 %6 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = and i32 %2, 7
  %42 = icmp ult i32 %2, 8
  br i1 %42, label %83, label %43

43:                                               ; preds = %37
  %44 = and i32 %2, -8
  br label %45

45:                                               ; preds = %45, %43
  %46 = phi i32 [ %40, %43 ], [ %79, %45 ]
  %47 = phi i32 [ 0, %43 ], [ %80, %45 ]
  %48 = phi i32 [ 0, %43 ], [ %81, %45 ]
  %49 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %47
  %50 = load i32, i32 addrspace(3)* %49, align 16, !tbaa !7
  %51 = add i32 %46, %50
  %52 = or i32 %47, 1
  %53 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %52
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !7
  %55 = add i32 %51, %54
  %56 = or i32 %47, 2
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 8, !tbaa !7
  %59 = add i32 %55, %58
  %60 = or i32 %47, 3
  %61 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !7
  %63 = add i32 %59, %62
  %64 = or i32 %47, 4
  %65 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 16, !tbaa !7
  %67 = add i32 %63, %66
  %68 = or i32 %47, 5
  %69 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %68
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !7
  %71 = add i32 %67, %70
  %72 = or i32 %47, 6
  %73 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 8, !tbaa !7
  %75 = add i32 %71, %74
  %76 = or i32 %47, 7
  %77 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !7
  %79 = add i32 %75, %78
  %80 = add nuw nsw i32 %47, 8
  %81 = add i32 %48, 8
  %82 = icmp eq i32 %81, %44
  br i1 %82, label %83, label %45, !llvm.loop !13

83:                                               ; preds = %45, %37
  %84 = phi i32 [ undef, %37 ], [ %79, %45 ]
  %85 = phi i32 [ %40, %37 ], [ %79, %45 ]
  %86 = phi i32 [ 0, %37 ], [ %80, %45 ]
  %87 = icmp eq i32 %41, 0
  br i1 %87, label %98, label %88

88:                                               ; preds = %83, %88
  %89 = phi i32 [ %94, %88 ], [ %85, %83 ]
  %90 = phi i32 [ %95, %88 ], [ %86, %83 ]
  %91 = phi i32 [ %96, %88 ], [ 0, %83 ]
  %92 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ11update_binsPjPiiiE4temp, i32 0, i32 %90
  %93 = load i32, i32 addrspace(3)* %92, align 4, !tbaa !7
  %94 = add i32 %89, %93
  %95 = add nuw nsw i32 %90, 1
  %96 = add i32 %91, 1
  %97 = icmp eq i32 %96, %41
  br i1 %97, label %98, label %88, !llvm.loop !14

98:                                               ; preds = %88, %83
  %99 = phi i32 [ %84, %83 ], [ %94, %88 ]
  store i32 %99, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %100

100:                                              ; preds = %98, %33
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
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
