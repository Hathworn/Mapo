; ModuleID = '../data/hip_kernels/302/8/main.cu'
source_filename = "../data/hip_kernels/302/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@square = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21kernel_euclidean_normPKdiPd(double addrspace(1)* nocapture readonly %0, i32 %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds double, double addrspace(1)* %0, i64 %5
  %7 = load double, double addrspace(1)* %6, align 8, !tbaa !5, !amdgpu.noclobber !9
  %8 = fmul contract double %7, %7
  %9 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %4
  store double %8, double addrspace(3)* %9, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %10 = icmp eq i32 %4, 0
  br i1 %10, label %11, label %95

11:                                               ; preds = %3
  %12 = icmp sgt i32 %1, 0
  br i1 %12, label %13, label %33

13:                                               ; preds = %11
  %14 = and i32 %1, 7
  %15 = icmp ult i32 %1, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %13
  %17 = and i32 %1, -8
  br label %57

18:                                               ; preds = %57, %13
  %19 = phi double [ undef, %13 ], [ %91, %57 ]
  %20 = phi i32 [ 0, %13 ], [ %92, %57 ]
  %21 = phi double [ 0.000000e+00, %13 ], [ %91, %57 ]
  %22 = icmp eq i32 %14, 0
  br i1 %22, label %33, label %23

23:                                               ; preds = %18, %23
  %24 = phi i32 [ %30, %23 ], [ %20, %18 ]
  %25 = phi double [ %29, %23 ], [ %21, %18 ]
  %26 = phi i32 [ %31, %23 ], [ 0, %18 ]
  %27 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %24
  %28 = load double, double addrspace(3)* %27, align 8, !tbaa !5
  %29 = fadd contract double %25, %28
  %30 = add nuw nsw i32 %24, 1
  %31 = add i32 %26, 1
  %32 = icmp eq i32 %31, %14
  br i1 %32, label %33, label %23, !llvm.loop !10

33:                                               ; preds = %18, %23, %11
  %34 = phi double [ 0.000000e+00, %11 ], [ %19, %18 ], [ %29, %23 ]
  %35 = fcmp olt double %34, 0x1000000000000000
  %36 = select i1 %35, double 0x4FF0000000000000, double 1.000000e+00
  %37 = fmul double %34, %36
  %38 = tail call double @llvm.amdgcn.rsq.f64(double %37)
  %39 = fmul double %37, %38
  %40 = fmul double %38, 5.000000e-01
  %41 = fneg double %40
  %42 = tail call double @llvm.fma.f64(double %41, double %39, double 5.000000e-01)
  %43 = tail call double @llvm.fma.f64(double %40, double %42, double %40)
  %44 = tail call double @llvm.fma.f64(double %39, double %42, double %39)
  %45 = fneg double %44
  %46 = tail call double @llvm.fma.f64(double %45, double %44, double %37)
  %47 = tail call double @llvm.fma.f64(double %46, double %43, double %44)
  %48 = fneg double %47
  %49 = tail call double @llvm.fma.f64(double %48, double %47, double %37)
  %50 = tail call double @llvm.fma.f64(double %49, double %43, double %47)
  %51 = select i1 %35, double 0x37F0000000000000, double 1.000000e+00
  %52 = fmul double %51, %50
  %53 = fcmp oeq double %37, 0.000000e+00
  %54 = fcmp oeq double %37, 0x7FF0000000000000
  %55 = or i1 %53, %54
  %56 = select i1 %55, double %37, double %52
  store double %56, double addrspace(1)* %2, align 8, !tbaa !5
  br label %95

57:                                               ; preds = %57, %16
  %58 = phi i32 [ 0, %16 ], [ %92, %57 ]
  %59 = phi double [ 0.000000e+00, %16 ], [ %91, %57 ]
  %60 = phi i32 [ 0, %16 ], [ %93, %57 ]
  %61 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %58
  %62 = load double, double addrspace(3)* %61, align 8, !tbaa !5
  %63 = fadd contract double %59, %62
  %64 = or i32 %58, 1
  %65 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %64
  %66 = load double, double addrspace(3)* %65, align 8, !tbaa !5
  %67 = fadd contract double %63, %66
  %68 = or i32 %58, 2
  %69 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %68
  %70 = load double, double addrspace(3)* %69, align 8, !tbaa !5
  %71 = fadd contract double %67, %70
  %72 = or i32 %58, 3
  %73 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %72
  %74 = load double, double addrspace(3)* %73, align 8, !tbaa !5
  %75 = fadd contract double %71, %74
  %76 = or i32 %58, 4
  %77 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %76
  %78 = load double, double addrspace(3)* %77, align 8, !tbaa !5
  %79 = fadd contract double %75, %78
  %80 = or i32 %58, 5
  %81 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %80
  %82 = load double, double addrspace(3)* %81, align 8, !tbaa !5
  %83 = fadd contract double %79, %82
  %84 = or i32 %58, 6
  %85 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %84
  %86 = load double, double addrspace(3)* %85, align 8, !tbaa !5
  %87 = fadd contract double %83, %86
  %88 = or i32 %58, 7
  %89 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @square, i32 0, i32 %88
  %90 = load double, double addrspace(3)* %89, align 8, !tbaa !5
  %91 = fadd contract double %87, %90
  %92 = add nuw nsw i32 %58, 8
  %93 = add nuw i32 %60, 8
  %94 = icmp eq i32 %93, %17
  br i1 %94, label %18, label %57, !llvm.loop !12

95:                                               ; preds = %33, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
