; ModuleID = '../data/hip_kernels/15412/126/main.cu'
source_filename = "../data/hip_kernels/15412/126/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29backward_maxpool_layer_kerneliiiiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = sub i32 %1, %6
  %13 = add i32 %12, %7
  %14 = sdiv i32 %13, %5
  %15 = add nsw i32 %14, 1
  %16 = sub i32 %2, %6
  %17 = add i32 %16, %7
  %18 = sdiv i32 %17, %4
  %19 = add nsw i32 %18, 1
  %20 = add nsw i32 %6, -1
  %21 = sdiv i32 %20, %4
  %22 = sdiv i32 %20, %5
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !4
  %29 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !13, !invariant.load !14
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %28, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %28, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %37, %24
  %39 = add i32 %38, %23
  %40 = mul i32 %39, %32
  %41 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %42 = add i32 %40, %41
  %43 = icmp slt i32 %42, %0
  br i1 %43, label %44, label %157

44:                                               ; preds = %11
  %45 = freeze i32 %42
  %46 = freeze i32 %2
  %47 = sdiv i32 %45, %46
  %48 = sdiv i32 %7, -2
  %49 = icmp slt i32 %22, 0
  br i1 %49, label %151, label %50

50:                                               ; preds = %44
  %51 = sub nsw i32 0, %22
  %52 = freeze i32 %47
  %53 = freeze i32 %1
  %54 = sdiv i32 %52, %53
  %55 = freeze i32 %54
  %56 = mul i32 %54, %53
  %57 = sub i32 %52, %56
  %58 = mul i32 %47, %46
  %59 = sub i32 %45, %58
  %60 = icmp slt i32 %21, 0
  %61 = sub nsw i32 %59, %48
  %62 = sub nsw i32 %57, %48
  %63 = mul nsw i32 %55, %15
  %64 = tail call i32 @llvm.abs.i32(i32 %21, i1 false)
  %65 = add i32 %21, %64
  %66 = and i32 %65, 1
  %67 = icmp eq i32 %66, 0
  %68 = icmp eq i32 %65, 0
  br label %69

69:                                               ; preds = %50, %147
  %70 = phi float [ 0.000000e+00, %50 ], [ %148, %147 ]
  %71 = phi i32 [ %51, %50 ], [ %149, %147 ]
  br i1 %60, label %147, label %72

72:                                               ; preds = %69
  %73 = sdiv i32 %61, %4
  %74 = sdiv i32 %62, %5
  %75 = add nsw i32 %74, %71
  %76 = add nsw i32 %75, %63
  %77 = mul nsw i32 %76, %19
  %78 = icmp sgt i32 %75, -1
  %79 = icmp sle i32 %75, %14
  br i1 %67, label %80, label %99

80:                                               ; preds = %72
  %81 = sub i32 %73, %21
  %82 = add nsw i32 %77, %81
  %83 = icmp sgt i32 %81, -1
  br i1 %83, label %84, label %96

84:                                               ; preds = %80
  %85 = icmp sle i32 %81, %18
  %86 = select i1 %85, i1 %78, i1 false
  %87 = select i1 %86, i1 %79, i1 false
  br i1 %87, label %88, label %96

88:                                               ; preds = %84
  %89 = sext i32 %82 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !16, !amdgpu.noclobber !14
  %92 = icmp eq i32 %91, %42
  br i1 %92, label %93, label %96

93:                                               ; preds = %88
  %94 = getelementptr inbounds float, float addrspace(1)* %8, i64 %89
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !20, !amdgpu.noclobber !14
  br label %96

96:                                               ; preds = %93, %88, %84, %80
  %97 = phi contract float [ %95, %93 ], [ 0.000000e+00, %88 ], [ 0.000000e+00, %84 ], [ 0.000000e+00, %80 ]
  %98 = fadd contract float %70, %97
  br label %99

99:                                               ; preds = %96, %72
  %100 = phi float [ undef, %72 ], [ %98, %96 ]
  %101 = phi float [ %70, %72 ], [ %98, %96 ]
  %102 = phi i32 [ 0, %72 ], [ 1, %96 ]
  br i1 %68, label %147, label %103

103:                                              ; preds = %99
  %104 = sub i32 %102, %21
  br label %105

105:                                              ; preds = %142, %103
  %106 = phi float [ %101, %103 ], [ %144, %142 ]
  %107 = phi i32 [ %104, %103 ], [ %145, %142 ]
  %108 = add nsw i32 %73, %107
  %109 = add nsw i32 %77, %108
  %110 = icmp sgt i32 %108, -1
  br i1 %110, label %111, label %123

111:                                              ; preds = %105
  %112 = icmp sle i32 %108, %18
  %113 = select i1 %112, i1 %78, i1 false
  %114 = select i1 %113, i1 %79, i1 false
  br i1 %114, label %115, label %123

115:                                              ; preds = %111
  %116 = sext i32 %109 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !16, !amdgpu.noclobber !14
  %119 = icmp eq i32 %118, %42
  br i1 %119, label %120, label %123

120:                                              ; preds = %115
  %121 = getelementptr inbounds float, float addrspace(1)* %8, i64 %116
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !20, !amdgpu.noclobber !14
  br label %123

123:                                              ; preds = %105, %111, %115, %120
  %124 = phi contract float [ %122, %120 ], [ 0.000000e+00, %115 ], [ 0.000000e+00, %111 ], [ 0.000000e+00, %105 ]
  %125 = fadd contract float %106, %124
  %126 = add i32 %107, 1
  %127 = add nsw i32 %73, %126
  %128 = add nsw i32 %77, %127
  %129 = icmp sgt i32 %127, -1
  br i1 %129, label %130, label %142

130:                                              ; preds = %123
  %131 = icmp sle i32 %127, %18
  %132 = select i1 %131, i1 %78, i1 false
  %133 = select i1 %132, i1 %79, i1 false
  br i1 %133, label %134, label %142

134:                                              ; preds = %130
  %135 = sext i32 %128 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %135
  %137 = load i32, i32 addrspace(1)* %136, align 4, !tbaa !16, !amdgpu.noclobber !14
  %138 = icmp eq i32 %137, %42
  br i1 %138, label %139, label %142

139:                                              ; preds = %134
  %140 = getelementptr inbounds float, float addrspace(1)* %8, i64 %135
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !20, !amdgpu.noclobber !14
  br label %142

142:                                              ; preds = %139, %134, %130, %123
  %143 = phi contract float [ %141, %139 ], [ 0.000000e+00, %134 ], [ 0.000000e+00, %130 ], [ 0.000000e+00, %123 ]
  %144 = fadd contract float %125, %143
  %145 = add i32 %107, 2
  %146 = icmp eq i32 %126, %64
  br i1 %146, label %147, label %105, !llvm.loop !22

147:                                              ; preds = %99, %142, %69
  %148 = phi float [ %70, %69 ], [ %100, %99 ], [ %144, %142 ]
  %149 = add i32 %71, 1
  %150 = icmp eq i32 %71, %22
  br i1 %150, label %151, label %69, !llvm.loop !24

151:                                              ; preds = %147, %44
  %152 = phi float [ 0.000000e+00, %44 ], [ %148, %147 ]
  %153 = sext i32 %42 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %9, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !20, !amdgpu.noclobber !14
  %156 = fadd contract float %152, %155
  store float %156, float addrspace(1)* %154, align 4, !tbaa !20
  br label %157

157:                                              ; preds = %11, %151
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
