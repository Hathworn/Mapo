; ModuleID = '../data/hip_kernels/18083/0/main.cu'
source_filename = "../data/hip_kernels/18083/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct._fmap = type { i32*, i32, i32, i32, i32 }

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z4convP5_fmapPiS1_iiS0_iiS1_ii(%struct._fmap addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, %struct._fmap addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 addrspace(1)* nocapture %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 16
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 8, !tbaa !4
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !13, !invariant.load !14
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 4, !tbaa !15
  %31 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 4, !range !13, !invariant.load !14
  %34 = zext i16 %33 to i32
  %35 = udiv i32 %30, %34
  %36 = mul i32 %35, %34
  %37 = icmp ugt i32 %30, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %27
  %41 = add i32 %40, %12
  %42 = mul i32 %41, %25
  %43 = add i32 %42, %26
  %44 = mul i32 %43, %34
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %46 = add i32 %44, %45
  %47 = getelementptr inbounds %struct._fmap, %struct._fmap addrspace(1)* %0, i64 0, i32 2
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !17, !amdgpu.noclobber !14
  %49 = getelementptr inbounds %struct._fmap, %struct._fmap addrspace(1)* %0, i64 0, i32 3
  %50 = load i32, i32 addrspace(1)* %49, align 8, !tbaa !23, !amdgpu.noclobber !14
  %51 = getelementptr inbounds %struct._fmap, %struct._fmap addrspace(1)* %0, i64 0, i32 4
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !24, !amdgpu.noclobber !14
  %53 = getelementptr inbounds %struct._fmap, %struct._fmap addrspace(1)* %5, i64 0, i32 2
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !17, !amdgpu.noclobber !14
  %55 = getelementptr inbounds %struct._fmap, %struct._fmap addrspace(1)* %5, i64 0, i32 3
  %56 = load i32, i32 addrspace(1)* %55, align 8, !tbaa !23, !amdgpu.noclobber !14
  %57 = getelementptr inbounds %struct._fmap, %struct._fmap addrspace(1)* %5, i64 0, i32 4
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !24, !amdgpu.noclobber !14
  %59 = shl nsw i32 %10, 1
  %60 = add nsw i32 %50, %59
  %61 = shl nsw i32 %9, 1
  %62 = add nsw i32 %52, %61
  %63 = mul i32 %4, %3
  %64 = mul i32 %63, %48
  %65 = mul i32 %64, %54
  %66 = mul i32 %65, %56
  %67 = mul i32 %66, %58
  %68 = freeze i32 %46
  %69 = freeze i32 %67
  %70 = udiv i32 %68, %69
  %71 = mul i32 %70, %69
  %72 = sub i32 %68, %71
  %73 = mul i32 %64, %56
  %74 = mul i32 %73, %58
  %75 = freeze i32 %74
  %76 = udiv i32 %72, %75
  %77 = mul i32 %76, %75
  %78 = sub i32 %72, %77
  %79 = mul i32 %64, %58
  %80 = freeze i32 %78
  %81 = freeze i32 %79
  %82 = udiv i32 %80, %81
  %83 = mul i32 %82, %81
  %84 = sub i32 %80, %83
  %85 = freeze i32 %64
  %86 = udiv i32 %84, %85
  %87 = mul i32 %86, %85
  %88 = sub i32 %84, %87
  %89 = freeze i32 %88
  %90 = freeze i32 %63
  %91 = udiv i32 %89, %90
  %92 = mul i32 %91, %90
  %93 = sub i32 %89, %92
  %94 = freeze i32 %4
  %95 = udiv i32 %93, %94
  %96 = mul i32 %95, %94
  %97 = sub i32 %93, %96
  %98 = mul i32 %62, %60
  %99 = mul i32 %98, %48
  %100 = mul i32 %99, %70
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  %103 = mul i32 %98, %91
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %102, i64 %104
  %106 = mul nsw i32 %82, %7
  %107 = add nsw i32 %95, %106
  %108 = mul nsw i32 %107, %62
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %105, i64 %109
  %111 = mul nsw i32 %86, %6
  %112 = add nsw i32 %97, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %110, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !25, !amdgpu.noclobber !14
  %116 = mul i32 %64, %76
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %117
  %119 = mul i32 %63, %91
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %118, i64 %120
  %122 = mul nsw i32 %95, %4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %121, i64 %123
  %125 = sext i32 %97 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %124, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !25, !amdgpu.noclobber !14
  %128 = mul nsw i32 %127, %115
  %129 = mul i32 %58, %56
  %130 = mul i32 %129, %54
  %131 = mul i32 %130, %70
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %132
  %134 = mul i32 %129, %76
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %133, i64 %135
  %137 = mul nsw i32 %82, %58
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %136, i64 %138
  %140 = sext i32 %86 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %139, i64 %140
  %142 = atomicrmw add i32 addrspace(1)* %141, i32 %128 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 16}
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
!15 = !{!5, !9, i64 12}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !22, i64 12}
!18 = !{!"_ZTS5_fmap", !19, i64 0, !22, i64 8, !22, i64 12, !22, i64 16, !22, i64 20}
!19 = !{!"any pointer", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!"int", !20, i64 0}
!23 = !{!18, !22, i64 16}
!24 = !{!18, !22, i64 20}
!25 = !{!22, !22, i64 0}
