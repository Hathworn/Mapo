; ModuleID = '../data/hip_kernels/16034/126/main.cu'
source_filename = "../data/hip_kernels/16034/126/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_makeResultCorrelation(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = udiv i32 %16, %13
  %26 = mul i32 %25, %13
  %27 = icmp ugt i32 %16, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %24
  %31 = add i32 %30, %8
  %32 = mul i32 %31, %13
  %33 = add i32 %32, %7
  %34 = icmp slt i32 %33, %0
  br i1 %34, label %35, label %79

35:                                               ; preds = %6
  %36 = freeze i32 %33
  %37 = freeze i32 %1
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !16, !amdgpu.noclobber !6
  %44 = mul nsw i32 %38, %2
  %45 = add nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !20, !amdgpu.noclobber !6
  %49 = fpext float %48 to double
  %50 = sitofp i32 %2 to float
  %51 = fpext float %50 to double
  %52 = fmul contract double %51, 5.000000e-01
  %53 = fcmp olt double %52, 0x1000000000000000
  %54 = select i1 %53, double 0x4FF0000000000000, double 1.000000e+00
  %55 = fmul double %52, %54
  %56 = tail call double @llvm.amdgcn.rsq.f64(double %55)
  %57 = fmul double %55, %56
  %58 = fmul double %56, 5.000000e-01
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %59, double %57, double 5.000000e-01)
  %61 = tail call double @llvm.fma.f64(double %58, double %60, double %58)
  %62 = tail call double @llvm.fma.f64(double %57, double %60, double %57)
  %63 = fneg double %62
  %64 = tail call double @llvm.fma.f64(double %63, double %62, double %55)
  %65 = tail call double @llvm.fma.f64(double %64, double %61, double %62)
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %66, double %65, double %55)
  %68 = tail call double @llvm.fma.f64(double %67, double %61, double %65)
  %69 = select i1 %53, double 0x37F0000000000000, double 1.000000e+00
  %70 = fmul double %69, %68
  %71 = fcmp oeq double %55, 0.000000e+00
  %72 = fcmp oeq double %55, 0x7FF0000000000000
  %73 = or i1 %71, %72
  %74 = select i1 %73, double %55, double %70
  %75 = fdiv contract double %49, %74
  %76 = fptrunc double %75 to float
  %77 = sext i32 %33 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  store float %76, float addrspace(1)* %78, align 4, !tbaa !20
  br label %79

79:                                               ; preds = %35, %6
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
