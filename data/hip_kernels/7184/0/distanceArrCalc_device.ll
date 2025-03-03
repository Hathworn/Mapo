; ModuleID = '../data/hip_kernels/7184/0/main.cu'
source_filename = "../data/hip_kernels/7184/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15distanceArrCalciiPdS_S_(i32 %0, i32 %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = urem i32 %0, %10
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = icmp ugt i32 %15, %16
  br i1 %17, label %26, label %18

18:                                               ; preds = %5
  %19 = add i32 %14, 1
  %20 = udiv i32 %13, %10
  %21 = mul i32 %20, %10
  %22 = icmp ugt i32 %13, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = icmp eq i32 %19, %24
  br i1 %25, label %77, label %26

26:                                               ; preds = %18, %5
  %27 = mul i32 %14, %1
  %28 = add i32 %27, %16
  %29 = shl i32 %28, 1
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %31 = shl nuw nsw i32 %30, 1
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %3, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !16, !amdgpu.noclobber !5
  %35 = zext i32 %31 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %4, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !16, !amdgpu.noclobber !5
  %38 = fsub contract double %34, %37
  %39 = fmul contract double %38, %38
  %40 = add nuw nsw i32 %29, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %3, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !16, !amdgpu.noclobber !5
  %44 = add nuw nsw i32 %31, 1
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %4, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !16, !amdgpu.noclobber !5
  %48 = fsub contract double %43, %47
  %49 = fmul contract double %48, %48
  %50 = fadd contract double %39, %49
  %51 = fcmp olt double %50, 0x1000000000000000
  %52 = select i1 %51, double 0x4FF0000000000000, double 1.000000e+00
  %53 = fmul double %50, %52
  %54 = tail call double @llvm.amdgcn.rsq.f64(double %53)
  %55 = fmul double %53, %54
  %56 = fmul double %54, 5.000000e-01
  %57 = fneg double %56
  %58 = tail call double @llvm.fma.f64(double %57, double %55, double 5.000000e-01)
  %59 = tail call double @llvm.fma.f64(double %56, double %58, double %56)
  %60 = tail call double @llvm.fma.f64(double %55, double %58, double %55)
  %61 = fneg double %60
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double %53)
  %63 = tail call double @llvm.fma.f64(double %62, double %59, double %60)
  %64 = fneg double %63
  %65 = tail call double @llvm.fma.f64(double %64, double %63, double %53)
  %66 = tail call double @llvm.fma.f64(double %65, double %59, double %63)
  %67 = select i1 %51, double 0x37F0000000000000, double 1.000000e+00
  %68 = fmul double %67, %66
  %69 = fcmp oeq double %53, 0.000000e+00
  %70 = fcmp oeq double %53, 0x7FF0000000000000
  %71 = or i1 %69, %70
  %72 = select i1 %71, double %53, double %68
  %73 = mul i32 %30, %0
  %74 = add nsw i32 %28, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %2, i64 %75
  store double %72, double addrspace(1)* %76, align 8, !tbaa !16
  br label %77

77:                                               ; preds = %26, %18
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
