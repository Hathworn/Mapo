; ModuleID = '../data/hip_kernels/925/59/main.cu'
source_filename = "../data/hip_kernels/925/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11kharmonic_VPdS_S_S_S_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !4
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !13, !invariant.load !14
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 16
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 8, !tbaa !15
  %27 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = udiv i32 %26, %30
  %32 = mul i32 %31, %30
  %33 = icmp ugt i32 %26, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %37 = mul i32 %35, %36
  %38 = add i32 %37, %10
  %39 = mul i32 %38, %23
  %40 = add i32 %39, %9
  %41 = mul i32 %9, %18
  %42 = mul i32 %10, %30
  %43 = getelementptr i8, i8 addrspace(4)* %11, i64 8
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 4, !range !13, !invariant.load !14
  %46 = zext i16 %45 to i32
  %47 = mul i32 %36, %46
  %48 = mul i32 %40, %46
  %49 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %50 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %51 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %52 = add i32 %48, %50
  %53 = mul i32 %52, %30
  %54 = add i32 %53, %49
  %55 = mul i32 %54, %18
  %56 = add i32 %55, %51
  %57 = add i32 %41, %51
  %58 = add i32 %42, %49
  %59 = add i32 %47, %50
  %60 = getelementptr inbounds double, double addrspace(1)* %3, i64 3
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !17, !amdgpu.noclobber !14
  %62 = sext i32 %57 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !17, !amdgpu.noclobber !14
  %65 = getelementptr inbounds double, double addrspace(1)* %3, i64 6
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !17, !amdgpu.noclobber !14
  %67 = fadd contract double %64, %66
  %68 = fmul contract double %61, %67
  %69 = getelementptr inbounds double, double addrspace(1)* %3, i64 10
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !17, !amdgpu.noclobber !14
  %71 = getelementptr inbounds double, double addrspace(1)* %3, i64 4
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !17, !amdgpu.noclobber !14
  %73 = fmul contract double %70, %72
  %74 = sext i32 %58 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %1, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !17, !amdgpu.noclobber !14
  %77 = getelementptr inbounds double, double addrspace(1)* %3, i64 7
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !17, !amdgpu.noclobber !14
  %79 = fadd contract double %76, %78
  %80 = fmul contract double %73, %79
  %81 = getelementptr inbounds double, double addrspace(1)* %3, i64 11
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !17, !amdgpu.noclobber !14
  %83 = getelementptr inbounds double, double addrspace(1)* %3, i64 5
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !17, !amdgpu.noclobber !14
  %85 = fmul contract double %82, %84
  %86 = sext i32 %59 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %2, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !17, !amdgpu.noclobber !14
  %89 = getelementptr inbounds double, double addrspace(1)* %3, i64 8
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !17, !amdgpu.noclobber !14
  %91 = fadd contract double %88, %90
  %92 = fmul contract double %85, %91
  %93 = getelementptr inbounds double, double addrspace(1)* %3, i64 9
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !17, !amdgpu.noclobber !14
  %95 = fmul contract double %94, 5.000000e-01
  %96 = fmul contract double %68, %68
  %97 = fmul contract double %80, %80
  %98 = fadd contract double %96, %97
  %99 = fmul contract double %92, %92
  %100 = fadd contract double %98, %99
  %101 = sext i32 %56 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %4, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !17, !amdgpu.noclobber !14
  %104 = fmul contract double %103, %103
  %105 = getelementptr inbounds double, double addrspace(1)* %5, i64 %101
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !17, !amdgpu.noclobber !14
  %107 = fmul contract double %106, %106
  %108 = fadd contract double %104, %107
  %109 = getelementptr inbounds double, double addrspace(1)* %6, i64 %101
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !17, !amdgpu.noclobber !14
  %111 = fmul contract double %110, %110
  %112 = fadd contract double %108, %111
  %113 = fadd contract double %100, %112
  %114 = fmul contract double %95, %113
  %115 = getelementptr inbounds double, double addrspace(1)* %7, i64 %101
  store double %114, double addrspace(1)* %115, align 8, !tbaa !17
  ret void
}

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
