; ModuleID = '../data/hip_kernels/925/60/main.cu'
source_filename = "../data/hip_kernels/925/60/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ktorus_VPdS_S_S_S_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
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
  %60 = sext i32 %57 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !17, !amdgpu.noclobber !14
  %63 = getelementptr inbounds double, double addrspace(1)* %3, i64 6
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !17, !amdgpu.noclobber !14
  %65 = fsub contract double %62, %64
  %66 = fmul contract double %65, %65
  %67 = sext i32 %58 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !17, !amdgpu.noclobber !14
  %70 = getelementptr inbounds double, double addrspace(1)* %3, i64 7
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !17, !amdgpu.noclobber !14
  %72 = fsub contract double %69, %71
  %73 = fmul contract double %72, %72
  %74 = fadd contract double %66, %73
  %75 = fcmp olt double %74, 0x1000000000000000
  %76 = select i1 %75, double 0x4FF0000000000000, double 1.000000e+00
  %77 = fmul double %74, %76
  %78 = tail call double @llvm.amdgcn.rsq.f64(double %77)
  %79 = fmul double %77, %78
  %80 = fmul double %78, 5.000000e-01
  %81 = fneg double %80
  %82 = tail call double @llvm.fma.f64(double %81, double %79, double 5.000000e-01)
  %83 = tail call double @llvm.fma.f64(double %80, double %82, double %80)
  %84 = tail call double @llvm.fma.f64(double %79, double %82, double %79)
  %85 = fneg double %84
  %86 = tail call double @llvm.fma.f64(double %85, double %84, double %77)
  %87 = tail call double @llvm.fma.f64(double %86, double %83, double %84)
  %88 = fneg double %87
  %89 = tail call double @llvm.fma.f64(double %88, double %87, double %77)
  %90 = tail call double @llvm.fma.f64(double %89, double %83, double %87)
  %91 = select i1 %75, double 0x37F0000000000000, double 1.000000e+00
  %92 = fmul double %91, %90
  %93 = fcmp oeq double %77, 0.000000e+00
  %94 = fcmp oeq double %77, 0x7FF0000000000000
  %95 = or i1 %93, %94
  %96 = select i1 %95, double %77, double %92
  %97 = load double, double addrspace(1)* %3, align 8, !tbaa !17, !amdgpu.noclobber !14
  %98 = fmul contract double %97, 5.000000e-01
  %99 = fsub contract double %96, %98
  %100 = getelementptr inbounds double, double addrspace(1)* %3, i64 3
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !17, !amdgpu.noclobber !14
  %102 = fmul contract double %101, %101
  %103 = getelementptr inbounds double, double addrspace(1)* %3, i64 4
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !17, !amdgpu.noclobber !14
  %105 = fmul contract double %104, %104
  %106 = fadd contract double %102, %105
  %107 = getelementptr inbounds double, double addrspace(1)* %3, i64 5
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !17, !amdgpu.noclobber !14
  %109 = fmul contract double %108, 2.000000e+00
  %110 = fmul contract double %108, %109
  %111 = sext i32 %59 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %2, i64 %111
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !17, !amdgpu.noclobber !14
  %114 = getelementptr inbounds double, double addrspace(1)* %3, i64 8
  %115 = load double, double addrspace(1)* %114, align 8, !tbaa !17, !amdgpu.noclobber !14
  %116 = fsub contract double %113, %115
  %117 = fmul contract double %110, %116
  %118 = fmul contract double %116, %117
  %119 = fmul contract double %99, %99
  %120 = getelementptr inbounds double, double addrspace(1)* %3, i64 12
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !17, !amdgpu.noclobber !14
  %122 = fmul contract double %121, %99
  %123 = fmul contract double %113, %122
  %124 = fadd contract double %119, %123
  %125 = fmul contract double %106, %124
  %126 = fadd contract double %118, %125
  %127 = getelementptr inbounds double, double addrspace(1)* %3, i64 9
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !17, !amdgpu.noclobber !14
  %129 = fmul contract double %128, 5.000000e-01
  %130 = sext i32 %56 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %4, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !17, !amdgpu.noclobber !14
  %133 = fmul contract double %132, %132
  %134 = fadd contract double %133, %126
  %135 = getelementptr inbounds double, double addrspace(1)* %5, i64 %130
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !17, !amdgpu.noclobber !14
  %137 = fmul contract double %136, %136
  %138 = fadd contract double %137, %134
  %139 = getelementptr inbounds double, double addrspace(1)* %6, i64 %130
  %140 = load double, double addrspace(1)* %139, align 8, !tbaa !17, !amdgpu.noclobber !14
  %141 = fmul contract double %140, %140
  %142 = fadd contract double %141, %138
  %143 = fmul contract double %129, %142
  %144 = getelementptr inbounds double, double addrspace(1)* %7, i64 %130
  store double %143, double addrspace(1)* %144, align 8, !tbaa !17
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
