; ModuleID = '../data/hip_kernels/3108/0/main.cu'
source_filename = "../data/hip_kernels/3108/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5forcePdS_S_S_S_S_S_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = add nsw i32 %8, -1
  %20 = icmp slt i32 %18, %19
  %21 = icmp slt i32 %18, %8
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %114

23:                                               ; preds = %9
  %24 = sext i32 %18 to i64
  %25 = getelementptr inbounds double, double addrspace(1)* %1, i64 %24
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %24
  %27 = getelementptr inbounds double, double addrspace(1)* %3, i64 %24
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 %24
  %29 = getelementptr inbounds double, double addrspace(1)* %4, i64 %24
  %30 = getelementptr inbounds double, double addrspace(1)* %5, i64 %24
  %31 = getelementptr inbounds double, double addrspace(1)* %6, i64 %24
  %32 = getelementptr inbounds double, double addrspace(1)* %7, i64 %24
  %33 = add nsw i32 %18, 1
  %34 = icmp slt i32 %33, %8
  br i1 %34, label %35, label %114

35:                                               ; preds = %23, %108
  %36 = phi i32 [ %112, %108 ], [ %33, %23 ]
  %37 = phi double [ %111, %108 ], [ undef, %23 ]
  %38 = phi double [ %110, %108 ], [ undef, %23 ]
  %39 = phi double [ %109, %108 ], [ undef, %23 ]
  %40 = icmp eq i32 %18, %36
  br i1 %40, label %108, label %41

41:                                               ; preds = %35
  %42 = load double, double addrspace(1)* %25, align 8, !tbaa !7
  %43 = sext i32 %36 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %1, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fsub contract double %42, %45
  %47 = load double, double addrspace(1)* %26, align 8, !tbaa !7
  %48 = getelementptr inbounds double, double addrspace(1)* %2, i64 %43
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = fsub contract double %47, %49
  %51 = load double, double addrspace(1)* %27, align 8, !tbaa !7
  %52 = getelementptr inbounds double, double addrspace(1)* %3, i64 %43
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7
  %54 = fsub contract double %51, %53
  %55 = fmul contract double %46, %46
  %56 = fmul contract double %50, %50
  %57 = fadd contract double %55, %56
  %58 = fmul contract double %54, %54
  %59 = fadd contract double %57, %58
  %60 = fcmp olt double %59, 0x1000000000000000
  %61 = select i1 %60, double 0x4FF0000000000000, double 1.000000e+00
  %62 = fmul double %59, %61
  %63 = tail call double @llvm.amdgcn.rsq.f64(double %62)
  %64 = fmul double %62, %63
  %65 = fmul double %63, 5.000000e-01
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %66, double %64, double 5.000000e-01)
  %68 = tail call double @llvm.fma.f64(double %65, double %67, double %65)
  %69 = tail call double @llvm.fma.f64(double %64, double %67, double %64)
  %70 = fneg double %69
  %71 = tail call double @llvm.fma.f64(double %70, double %69, double %62)
  %72 = tail call double @llvm.fma.f64(double %71, double %68, double %69)
  %73 = fneg double %72
  %74 = tail call double @llvm.fma.f64(double %73, double %72, double %62)
  %75 = tail call double @llvm.fma.f64(double %74, double %68, double %72)
  %76 = select i1 %60, double 0x37F0000000000000, double 1.000000e+00
  %77 = fmul double %76, %75
  %78 = fcmp oeq double %62, 0.000000e+00
  %79 = fcmp oeq double %62, 0x7FF0000000000000
  %80 = or i1 %78, %79
  %81 = select i1 %80, double %62, double %77
  %82 = load double, double addrspace(1)* %28, align 8, !tbaa !7
  %83 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %85 = fmul contract double %82, %84
  %86 = fmul contract double %46, %85
  %87 = fmul contract double %81, %81
  %88 = fmul contract double %81, %87
  %89 = fdiv contract double %86, %88
  %90 = fadd contract double %37, %89
  %91 = fmul contract double %50, %85
  %92 = fdiv contract double %91, %88
  %93 = fadd contract double %38, %92
  %94 = fmul contract double %54, %85
  %95 = fdiv contract double %94, %88
  %96 = fadd contract double %39, %95
  %97 = load double, double addrspace(1)* %29, align 8, !tbaa !7
  %98 = fadd contract double %97, %90
  store double %98, double addrspace(1)* %29, align 8, !tbaa !7
  %99 = load double, double addrspace(1)* %30, align 8, !tbaa !7
  %100 = fadd contract double %99, %93
  store double %100, double addrspace(1)* %30, align 8, !tbaa !7
  %101 = load double, double addrspace(1)* %31, align 8, !tbaa !7
  %102 = fadd contract double %101, %96
  store double %102, double addrspace(1)* %31, align 8, !tbaa !7
  %103 = load double, double addrspace(1)* %32, align 8, !tbaa !7
  %104 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %105 = fdiv contract double %104, %81
  %106 = fmul contract double %105, 2.000000e+00
  %107 = fadd contract double %103, %106
  store double %107, double addrspace(1)* %32, align 8, !tbaa !7
  br label %108

108:                                              ; preds = %35, %41
  %109 = phi double [ %96, %41 ], [ %39, %35 ]
  %110 = phi double [ %93, %41 ], [ %38, %35 ]
  %111 = phi double [ %90, %41 ], [ %37, %35 ]
  %112 = add nsw i32 %36, 1
  %113 = icmp slt i32 %112, %8
  br i1 %113, label %35, label %114, !llvm.loop !11

114:                                              ; preds = %108, %23, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.peeled.count", i32 1}
