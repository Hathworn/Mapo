; ModuleID = '../data/hip_kernels/930/3/main.cu'
source_filename = "../data/hip_kernels/930/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25CorrelateDataBackward0_1diiiiiiiiiiiiiiiiiiiPfPKfS1_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, float addrspace(1)* nocapture writeonly %19, float addrspace(1)* nocapture readonly %20, float addrspace(1)* nocapture readonly %21) local_unnamed_addr #0 {
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 12
  %30 = bitcast i8 addrspace(4)* %29 to i32 addrspace(4)*
  %31 = load i32, i32 addrspace(4)* %30, align 4, !tbaa !6
  %32 = mul i32 %23, %28
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = add i32 %32, %33
  %35 = icmp slt i32 %34, %0
  br i1 %35, label %36, label %63

36:                                               ; preds = %22
  %37 = mul nsw i32 %10, 50000
  %38 = shl nsw i32 %9, 1
  %39 = add i32 %38, %6
  %40 = sub i32 %37, %39
  %41 = add nsw i32 %40, -1
  %42 = sub i32 %37, %38
  %43 = add nsw i32 %42, -1
  %44 = sub i32 %37, %6
  %45 = add nsw i32 %3, -1
  %46 = add nsw i32 %4, -1
  %47 = add nsw i32 %8, %7
  %48 = icmp sgt i32 %8, 0
  %49 = mul nsw i32 %15, %2
  %50 = mul nsw i32 %5, %2
  %51 = sub i32 %50, %7
  %52 = add nuw nsw i32 %38, 1
  %53 = mul nsw i32 %52, %52
  %54 = mul nsw i32 %53, %16
  %55 = sitofp i32 %54 to float
  %56 = mul nsw i32 %17, %2
  %57 = udiv i32 %31, %28
  %58 = mul i32 %57, %28
  %59 = icmp ugt i32 %31, %58
  %60 = zext i1 %59 to i32
  %61 = add i32 %57, %60
  %62 = mul i32 %61, %28
  br label %64

63:                                               ; preds = %145, %22
  ret void

64:                                               ; preds = %36, %145
  %65 = phi i32 [ %34, %36 ], [ %155, %145 ]
  %66 = freeze i32 %65
  %67 = freeze i32 %16
  %68 = sdiv i32 %66, %67
  %69 = mul i32 %68, %67
  %70 = sub i32 %66, %69
  %71 = freeze i32 %12
  %72 = sdiv i32 %68, %71
  %73 = mul i32 %72, %71
  %74 = sub i32 %68, %73
  %75 = add nsw i32 %74, %18
  %76 = srem i32 %72, %13
  %77 = add i32 %41, %75
  %78 = sdiv i32 %77, %10
  %79 = add nsw i32 %78, -49999
  %80 = add i32 %43, %76
  %81 = sdiv i32 %80, %10
  %82 = add nsw i32 %81, -49999
  %83 = add i32 %44, %75
  %84 = sdiv i32 %83, %10
  %85 = add nsw i32 %84, -50000
  %86 = add nsw i32 %76, %37
  %87 = sdiv i32 %86, %10
  %88 = add nsw i32 %87, -50000
  %89 = icmp sgt i32 %84, 49999
  %90 = icmp sgt i32 %87, 49999
  %91 = select i1 %89, i1 %90, i1 false
  br i1 %91, label %92, label %145

92:                                               ; preds = %64
  %93 = icmp slt i32 %79, %3
  %94 = icmp slt i32 %82, %4
  %95 = select i1 %93, i1 %94, i1 false
  br i1 %95, label %96, label %145

96:                                               ; preds = %92
  %97 = tail call i32 @llvm.smax.i32(i32 %79, i32 0)
  %98 = tail call i32 @llvm.smin.i32(i32 %45, i32 %85)
  %99 = tail call i32 @llvm.smax.i32(i32 %82, i32 0)
  %100 = tail call i32 @llvm.smin.i32(i32 %46, i32 %88)
  br i1 %48, label %101, label %145

101:                                              ; preds = %96
  %102 = add nsw i32 %76, %49
  %103 = mul nsw i32 %102, %14
  %104 = add i32 %103, %75
  %105 = icmp sgt i32 %99, %100
  %106 = icmp sgt i32 %97, %98
  br label %107

107:                                              ; preds = %101, %126
  %108 = phi float [ 0.000000e+00, %101 ], [ %127, %126 ]
  %109 = phi i32 [ %7, %101 ], [ %128, %126 ]
  %110 = mul nsw i32 %109, %11
  %111 = add i32 %104, %110
  %112 = mul nsw i32 %111, %16
  %113 = add nsw i32 %112, %70
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %20, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16
  br i1 %105, label %126, label %117

117:                                              ; preds = %107
  %118 = add i32 %51, %109
  %119 = mul nsw i32 %118, %4
  br label %120

120:                                              ; preds = %117, %130
  %121 = phi i32 [ %99, %117 ], [ %132, %130 ]
  %122 = phi float [ %108, %117 ], [ %131, %130 ]
  br i1 %106, label %130, label %123

123:                                              ; preds = %120
  %124 = add nsw i32 %121, %119
  %125 = mul nsw i32 %124, %3
  br label %134

126:                                              ; preds = %130, %107
  %127 = phi float [ %108, %107 ], [ %131, %130 ]
  %128 = add nsw i32 %109, 1
  %129 = icmp slt i32 %128, %47
  br i1 %129, label %107, label %145, !llvm.loop !20

130:                                              ; preds = %134, %120
  %131 = phi float [ %122, %120 ], [ %142, %134 ]
  %132 = add nuw nsw i32 %121, 1
  %133 = icmp slt i32 %121, %100
  br i1 %133, label %120, label %126, !llvm.loop !22

134:                                              ; preds = %123, %134
  %135 = phi i32 [ %97, %123 ], [ %143, %134 ]
  %136 = phi float [ %122, %123 ], [ %142, %134 ]
  %137 = add nsw i32 %135, %125
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %21, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !16
  %141 = fmul contract float %116, %140
  %142 = fadd contract float %136, %141
  %143 = add nuw nsw i32 %135, 1
  %144 = icmp slt i32 %135, %98
  br i1 %144, label %134, label %130, !llvm.loop !23

145:                                              ; preds = %126, %96, %92, %64
  %146 = phi float [ 0.000000e+00, %92 ], [ 0.000000e+00, %64 ], [ 0.000000e+00, %96 ], [ %127, %126 ]
  %147 = mul nsw i32 %70, %13
  %148 = add nsw i32 %76, %147
  %149 = mul nsw i32 %148, %12
  %150 = fdiv contract float %146, %55
  %151 = add i32 %74, %56
  %152 = add i32 %151, %149
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %19, i64 %153
  store float %150, float addrspace(1)* %154, align 4, !tbaa !16
  %155 = add i32 %62, %65
  %156 = icmp slt i32 %155, %0
  br i1 %156, label %64, label %63, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
