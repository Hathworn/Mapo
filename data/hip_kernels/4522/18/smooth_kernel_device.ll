; ModuleID = '../data/hip_kernels/4522/18/main.cu'
source_filename = "../data/hip_kernels/4522/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13smooth_kernelPfiiiiifS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
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
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %9
  %26 = mul i32 %25, %18
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %28, %1
  br i1 %29, label %30, label %176

30:                                               ; preds = %8
  %31 = freeze i32 %28
  %32 = freeze i32 %2
  %33 = sdiv i32 %31, %32
  %34 = mul i32 %33, %32
  %35 = sub i32 %31, %34
  %36 = freeze i32 %3
  %37 = sdiv i32 %33, %36
  %38 = mul i32 %37, %36
  %39 = sub i32 %33, %38
  %40 = freeze i32 %37
  %41 = sitofp i32 %5 to float
  %42 = fmul contract float %41, -5.000000e-01
  %43 = fptosi float %42 to i32
  %44 = mul nsw i32 %40, %3
  %45 = icmp sgt i32 %5, 0
  br i1 %45, label %46, label %176

46:                                               ; preds = %30
  %47 = add nsw i32 %44, %39
  %48 = mul nsw i32 %47, %2
  %49 = add nsw i32 %48, %35
  %50 = add nsw i32 %39, %43
  %51 = add nsw i32 %35, %43
  %52 = sext i32 %49 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = getelementptr inbounds float, float addrspace(1)* %7, i64 %52
  %55 = and i32 %5, 3
  %56 = icmp ult i32 %5, 4
  %57 = and i32 %5, -4
  %58 = icmp eq i32 %55, 0
  br label %59

59:                                               ; preds = %46, %173
  %60 = phi i32 [ 0, %46 ], [ %174, %173 ]
  %61 = add nsw i32 %50, %60
  %62 = add nsw i32 %61, %44
  %63 = mul nsw i32 %62, %2
  %64 = icmp sgt i32 %61, -1
  %65 = icmp slt i32 %61, %3
  br i1 %56, label %147, label %66

66:                                               ; preds = %59, %140
  %67 = phi i32 [ %144, %140 ], [ 0, %59 ]
  %68 = phi i32 [ %145, %140 ], [ 0, %59 ]
  %69 = add nsw i32 %51, %67
  %70 = add nsw i32 %69, %63
  br i1 %64, label %71, label %83

71:                                               ; preds = %66
  %72 = icmp sgt i32 %69, -1
  %73 = select i1 %65, i1 %72, i1 false
  %74 = icmp slt i32 %69, %2
  %75 = select i1 %73, i1 %74, i1 false
  br i1 %75, label %76, label %83

76:                                               ; preds = %71
  %77 = sext i32 %70 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %81 = fsub contract float %79, %80
  %82 = fmul contract float %81, %6
  br label %83

83:                                               ; preds = %66, %71, %76
  %84 = phi contract float [ %82, %76 ], [ 0.000000e+00, %71 ], [ 0.000000e+00, %66 ]
  %85 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %86 = fadd contract float %84, %85
  store float %86, float addrspace(1)* %54, align 4, !tbaa !16
  %87 = or i32 %67, 1
  %88 = add nsw i32 %51, %87
  %89 = add nsw i32 %88, %63
  br i1 %64, label %90, label %102

90:                                               ; preds = %83
  %91 = icmp sgt i32 %88, -1
  %92 = select i1 %65, i1 %91, i1 false
  %93 = icmp slt i32 %88, %2
  %94 = select i1 %92, i1 %93, i1 false
  br i1 %94, label %95, label %102

95:                                               ; preds = %90
  %96 = sext i32 %89 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %100 = fsub contract float %98, %99
  %101 = fmul contract float %100, %6
  br label %102

102:                                              ; preds = %95, %90, %83
  %103 = phi contract float [ %101, %95 ], [ 0.000000e+00, %90 ], [ 0.000000e+00, %83 ]
  %104 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %105 = fadd contract float %103, %104
  store float %105, float addrspace(1)* %54, align 4, !tbaa !16
  %106 = or i32 %67, 2
  %107 = add nsw i32 %51, %106
  %108 = add nsw i32 %107, %63
  br i1 %64, label %109, label %121

109:                                              ; preds = %102
  %110 = icmp sgt i32 %107, -1
  %111 = select i1 %65, i1 %110, i1 false
  %112 = icmp slt i32 %107, %2
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %121

114:                                              ; preds = %109
  %115 = sext i32 %108 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %119 = fsub contract float %117, %118
  %120 = fmul contract float %119, %6
  br label %121

121:                                              ; preds = %114, %109, %102
  %122 = phi contract float [ %120, %114 ], [ 0.000000e+00, %109 ], [ 0.000000e+00, %102 ]
  %123 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %124 = fadd contract float %122, %123
  store float %124, float addrspace(1)* %54, align 4, !tbaa !16
  %125 = or i32 %67, 3
  %126 = add nsw i32 %51, %125
  %127 = add nsw i32 %126, %63
  br i1 %64, label %128, label %140

128:                                              ; preds = %121
  %129 = icmp sgt i32 %126, -1
  %130 = select i1 %65, i1 %129, i1 false
  %131 = icmp slt i32 %126, %2
  %132 = select i1 %130, i1 %131, i1 false
  br i1 %132, label %133, label %140

133:                                              ; preds = %128
  %134 = sext i32 %127 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %138 = fsub contract float %136, %137
  %139 = fmul contract float %138, %6
  br label %140

140:                                              ; preds = %133, %128, %121
  %141 = phi contract float [ %139, %133 ], [ 0.000000e+00, %128 ], [ 0.000000e+00, %121 ]
  %142 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %143 = fadd contract float %141, %142
  store float %143, float addrspace(1)* %54, align 4, !tbaa !16
  %144 = add nuw nsw i32 %67, 4
  %145 = add i32 %68, 4
  %146 = icmp eq i32 %145, %57
  br i1 %146, label %147, label %66, !llvm.loop !20

147:                                              ; preds = %140, %59
  %148 = phi i32 [ 0, %59 ], [ %144, %140 ]
  br i1 %58, label %173, label %149

149:                                              ; preds = %147, %166
  %150 = phi i32 [ %170, %166 ], [ %148, %147 ]
  %151 = phi i32 [ %171, %166 ], [ 0, %147 ]
  %152 = add nsw i32 %51, %150
  %153 = add nsw i32 %152, %63
  br i1 %64, label %154, label %166

154:                                              ; preds = %149
  %155 = icmp sgt i32 %152, -1
  %156 = select i1 %65, i1 %155, i1 false
  %157 = icmp slt i32 %152, %2
  %158 = select i1 %156, i1 %157, i1 false
  br i1 %158, label %159, label %166

159:                                              ; preds = %154
  %160 = sext i32 %153 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %0, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !16
  %163 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %164 = fsub contract float %162, %163
  %165 = fmul contract float %164, %6
  br label %166

166:                                              ; preds = %159, %154, %149
  %167 = phi contract float [ %165, %159 ], [ 0.000000e+00, %154 ], [ 0.000000e+00, %149 ]
  %168 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %169 = fadd contract float %167, %168
  store float %169, float addrspace(1)* %54, align 4, !tbaa !16
  %170 = add nuw nsw i32 %150, 1
  %171 = add i32 %151, 1
  %172 = icmp eq i32 %171, %55
  br i1 %172, label %173, label %149, !llvm.loop !22

173:                                              ; preds = %166, %147
  %174 = add nuw nsw i32 %60, 1
  %175 = icmp eq i32 %174, %5
  br i1 %175, label %176, label %59, !llvm.loop !24

176:                                              ; preds = %173, %30, %8
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
