; ModuleID = '../data/hip_kernels/1143/55/main.cu'
source_filename = "../data/hip_kernels/1143/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17kring_rotation_AzPdS_S_ddddddddS_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readnone %2, double %3, double %4, double %5, double %6, double %7, double %8, double %9, double %10, double addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !4
  %19 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !13, !invariant.load !14
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %18, %22
  %24 = mul i32 %23, %22
  %25 = icmp ugt i32 %18, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 16
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 8, !tbaa !15
  %31 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 2, !range !13, !invariant.load !14
  %34 = zext i16 %33 to i32
  %35 = udiv i32 %30, %34
  %36 = mul i32 %35, %34
  %37 = icmp ugt i32 %30, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %41 = mul i32 %39, %40
  %42 = add i32 %41, %14
  %43 = mul i32 %42, %27
  %44 = add i32 %43, %13
  %45 = mul i32 %13, %22
  %46 = mul i32 %14, %34
  %47 = getelementptr i8, i8 addrspace(4)* %15, i64 8
  %48 = bitcast i8 addrspace(4)* %47 to i16 addrspace(4)*
  %49 = load i16, i16 addrspace(4)* %48, align 4, !range !13, !invariant.load !14
  %50 = zext i16 %49 to i32
  %51 = mul i32 %44, %50
  %52 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %53 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %54 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %55 = add i32 %51, %53
  %56 = mul i32 %55, %34
  %57 = add i32 %56, %52
  %58 = mul i32 %57, %22
  %59 = add i32 %58, %54
  %60 = add i32 %45, %54
  %61 = add i32 %46, %52
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !17, !amdgpu.noclobber !14
  %65 = fmul contract double %64, %64
  %66 = sext i32 %61 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %1, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !17, !amdgpu.noclobber !14
  %69 = fmul contract double %68, %68
  %70 = fadd contract double %65, %69
  %71 = fcmp olt double %70, 0x1000000000000000
  %72 = select i1 %71, double 0x4FF0000000000000, double 1.000000e+00
  %73 = fmul double %70, %72
  %74 = tail call double @llvm.amdgcn.rsq.f64(double %73)
  %75 = fmul double %73, %74
  %76 = fmul double %74, 5.000000e-01
  %77 = fneg double %76
  %78 = tail call double @llvm.fma.f64(double %77, double %75, double 5.000000e-01)
  %79 = tail call double @llvm.fma.f64(double %76, double %78, double %76)
  %80 = tail call double @llvm.fma.f64(double %75, double %78, double %75)
  %81 = fneg double %80
  %82 = tail call double @llvm.fma.f64(double %81, double %80, double %73)
  %83 = tail call double @llvm.fma.f64(double %82, double %79, double %80)
  %84 = fneg double %83
  %85 = tail call double @llvm.fma.f64(double %84, double %83, double %73)
  %86 = tail call double @llvm.fma.f64(double %85, double %79, double %83)
  %87 = select i1 %71, double 0x37F0000000000000, double 1.000000e+00
  %88 = fmul double %87, %86
  %89 = fcmp oeq double %73, 0.000000e+00
  %90 = fcmp oeq double %73, 0x7FF0000000000000
  %91 = or i1 %89, %90
  %92 = select i1 %91, double %73, double %88
  %93 = fmul contract double %92, %9
  %94 = fmul contract double %93, %6
  %95 = sext i32 %59 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %11, i64 %95
  store double %94, double addrspace(1)* %96, align 8, !tbaa !17
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
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
