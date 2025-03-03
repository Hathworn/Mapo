; ModuleID = '../data/hip_kernels/6132/0/main.cu'
source_filename = "../data/hip_kernels/6132/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11calculatePiPdli(double addrspace(1)* nocapture %0, i64 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %2 to i64
  %14 = sdiv i64 %1, %13
  %15 = sext i32 %12 to i64
  %16 = mul nsw i64 %14, %15
  %17 = add nsw i64 %14, -1
  %18 = add i64 %17, %16
  br label %19

19:                                               ; preds = %19, %3
  %20 = phi double [ 0.000000e+00, %3 ], [ %30, %19 ]
  %21 = phi i64 [ %16, %3 ], [ %31, %19 ]
  %22 = shl i64 %21, 1
  %23 = add nuw nsw i64 %22, 1
  %24 = sitofp i64 %23 to double
  %25 = fdiv contract double 4.000000e+00, %24
  %26 = fadd contract double %20, %25
  %27 = add i64 %22, 3
  %28 = sitofp i64 %27 to double
  %29 = fdiv contract double 4.000000e+00, %28
  %30 = fsub contract double %26, %29
  %31 = add nsw i64 %21, 2
  %32 = icmp slt i64 %31, %18
  br i1 %32, label %19, label %33, !llvm.loop !7

33:                                               ; preds = %19
  %34 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  store double %30, double addrspace(1)* %34, align 8, !tbaa !9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp eq i32 %12, 0
  %36 = icmp sgt i32 %2, 1
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %98

38:                                               ; preds = %33
  %39 = load double, double addrspace(1)* %0, align 8, !tbaa !9
  %40 = add nsw i64 %13, -1
  %41 = add nsw i64 %13, -2
  %42 = and i64 %40, 7
  %43 = icmp ult i64 %41, 7
  br i1 %43, label %84, label %44

44:                                               ; preds = %38
  %45 = and i64 %40, -8
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi double [ %39, %44 ], [ %80, %46 ]
  %48 = phi i64 [ 1, %44 ], [ %81, %46 ]
  %49 = phi i64 [ 0, %44 ], [ %82, %46 ]
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !9
  %52 = fadd contract double %47, %51
  store double %52, double addrspace(1)* %0, align 8, !tbaa !9
  %53 = add nuw nsw i64 %48, 1
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !9
  %56 = fadd contract double %52, %55
  store double %56, double addrspace(1)* %0, align 8, !tbaa !9
  %57 = add nuw nsw i64 %48, 2
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !9
  %60 = fadd contract double %56, %59
  store double %60, double addrspace(1)* %0, align 8, !tbaa !9
  %61 = add nuw nsw i64 %48, 3
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !9
  %64 = fadd contract double %60, %63
  store double %64, double addrspace(1)* %0, align 8, !tbaa !9
  %65 = add nuw nsw i64 %48, 4
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !9
  %68 = fadd contract double %64, %67
  store double %68, double addrspace(1)* %0, align 8, !tbaa !9
  %69 = add nuw nsw i64 %48, 5
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !9
  %72 = fadd contract double %68, %71
  store double %72, double addrspace(1)* %0, align 8, !tbaa !9
  %73 = add nuw nsw i64 %48, 6
  %74 = getelementptr inbounds double, double addrspace(1)* %0, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !9
  %76 = fadd contract double %72, %75
  store double %76, double addrspace(1)* %0, align 8, !tbaa !9
  %77 = add nuw nsw i64 %48, 7
  %78 = getelementptr inbounds double, double addrspace(1)* %0, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !9
  %80 = fadd contract double %76, %79
  store double %80, double addrspace(1)* %0, align 8, !tbaa !9
  %81 = add nuw nsw i64 %48, 8
  %82 = add nuw i64 %49, 8
  %83 = icmp eq i64 %82, %45
  br i1 %83, label %84, label %46, !llvm.loop !13

84:                                               ; preds = %46, %38
  %85 = phi double [ %39, %38 ], [ %80, %46 ]
  %86 = phi i64 [ 1, %38 ], [ %81, %46 ]
  %87 = icmp eq i64 %42, 0
  br i1 %87, label %98, label %88

88:                                               ; preds = %84, %88
  %89 = phi double [ %94, %88 ], [ %85, %84 ]
  %90 = phi i64 [ %95, %88 ], [ %86, %84 ]
  %91 = phi i64 [ %96, %88 ], [ 0, %84 ]
  %92 = getelementptr inbounds double, double addrspace(1)* %0, i64 %90
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !9
  %94 = fadd contract double %89, %93
  store double %94, double addrspace(1)* %0, align 8, !tbaa !9
  %95 = add nuw nsw i64 %90, 1
  %96 = add i64 %91, 1
  %97 = icmp eq i64 %96, %42
  br i1 %97, label %98, label %88, !llvm.loop !14

98:                                               ; preds = %84, %88, %33
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
