; ModuleID = '../data/hip_kernels/2818/16/main.cu'
source_filename = "../data/hip_kernels/2818/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z41_bcnn_backward_depthwise_conv_data_kerneliPfS_iiiiiiiiiS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, float addrspace(1)* nocapture %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !6
  %23 = mul i32 %14, %19
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %27, label %192

27:                                               ; preds = %13
  %28 = mul i32 %9, %9
  %29 = icmp sgt i32 %9, 0
  %30 = udiv i32 %22, %19
  %31 = mul i32 %30, %19
  %32 = icmp ugt i32 %22, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %19
  %36 = and i32 %9, 1
  %37 = icmp eq i32 %9, 1
  %38 = and i32 %9, -2
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %27, %184
  %41 = phi i32 [ %25, %27 ], [ %190, %184 ]
  %42 = sdiv i32 %41, %7
  %43 = sdiv i32 %42, %8
  %44 = srem i32 %43, %4
  br i1 %29, label %45, label %184

45:                                               ; preds = %40
  %46 = mul i32 %28, %44
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = freeze i32 %41
  %50 = freeze i32 %8
  %51 = sdiv i32 %49, %50
  %52 = mul i32 %51, %50
  %53 = sub i32 %49, %52
  %54 = srem i32 %51, %7
  %55 = sdiv i32 %41, %4
  %56 = sdiv i32 %55, %7
  %57 = sdiv i32 %56, %8
  %58 = add nsw i32 %54, %11
  %59 = add nsw i32 %53, %11
  %60 = mul nsw i32 %57, %4
  %61 = add nsw i32 %44, %60
  %62 = mul nsw i32 %61, %5
  br label %63

63:                                               ; preds = %45, %179
  %64 = phi float addrspace(1)* [ %48, %45 ], [ %181, %179 ]
  %65 = phi float [ 0.000000e+00, %45 ], [ %180, %179 ]
  %66 = phi i32 [ 0, %45 ], [ %182, %179 ]
  %67 = sub i32 %58, %66
  %68 = freeze i32 %67
  %69 = freeze i32 %10
  %70 = sdiv i32 %68, %69
  %71 = mul i32 %70, %69
  %72 = sub i32 %68, %71
  %73 = icmp eq i32 %72, 0
  br i1 %37, label %143, label %74

74:                                               ; preds = %63, %137
  %75 = phi float addrspace(1)* [ %139, %137 ], [ %64, %63 ]
  %76 = phi float [ %138, %137 ], [ %65, %63 ]
  %77 = phi i32 [ %140, %137 ], [ 0, %63 ]
  %78 = phi i32 [ %141, %137 ], [ 0, %63 ]
  %79 = sub i32 %59, %77
  br i1 %73, label %80, label %106

80:                                               ; preds = %74
  %81 = freeze i32 %79
  %82 = freeze i32 %10
  %83 = sdiv i32 %81, %82
  %84 = mul i32 %83, %82
  %85 = sub i32 %81, %84
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %106

87:                                               ; preds = %80
  %88 = sdiv i32 %67, %10
  %89 = icmp sgt i32 %88, -1
  br i1 %89, label %90, label %106

90:                                               ; preds = %87
  %91 = icmp slt i32 %88, %5
  %92 = icmp sgt i32 %83, -1
  %93 = select i1 %91, i1 %92, i1 false
  %94 = icmp slt i32 %83, %6
  %95 = select i1 %93, i1 %94, i1 false
  br i1 %95, label %96, label %106

96:                                               ; preds = %90
  %97 = add nsw i32 %88, %62
  %98 = mul nsw i32 %97, %6
  %99 = add nsw i32 %98, %83
  %100 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %101 = sext i32 %99 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = fmul contract float %100, %103
  %105 = fadd contract float %76, %104
  br label %106

106:                                              ; preds = %87, %90, %96, %80, %74
  %107 = phi float [ %105, %96 ], [ %76, %90 ], [ %76, %87 ], [ %76, %80 ], [ %76, %74 ]
  %108 = getelementptr inbounds float, float addrspace(1)* %75, i64 1
  %109 = xor i32 %77, -1
  %110 = add i32 %59, %109
  br i1 %73, label %111, label %137

111:                                              ; preds = %106
  %112 = freeze i32 %110
  %113 = freeze i32 %10
  %114 = sdiv i32 %112, %113
  %115 = mul i32 %114, %113
  %116 = sub i32 %112, %115
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %137

118:                                              ; preds = %111
  %119 = sdiv i32 %67, %10
  %120 = icmp sgt i32 %119, -1
  br i1 %120, label %121, label %137

121:                                              ; preds = %118
  %122 = icmp slt i32 %119, %5
  %123 = icmp sgt i32 %114, -1
  %124 = select i1 %122, i1 %123, i1 false
  %125 = icmp slt i32 %114, %6
  %126 = select i1 %124, i1 %125, i1 false
  br i1 %126, label %127, label %137

127:                                              ; preds = %121
  %128 = add nsw i32 %119, %62
  %129 = mul nsw i32 %128, %6
  %130 = add nsw i32 %129, %114
  %131 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %132 = sext i32 %130 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = fmul contract float %131, %134
  %136 = fadd contract float %107, %135
  br label %137

137:                                              ; preds = %127, %121, %118, %111, %106
  %138 = phi float [ %136, %127 ], [ %107, %121 ], [ %107, %118 ], [ %107, %111 ], [ %107, %106 ]
  %139 = getelementptr inbounds float, float addrspace(1)* %75, i64 2
  %140 = add nuw nsw i32 %77, 2
  %141 = add i32 %78, 2
  %142 = icmp eq i32 %141, %38
  br i1 %142, label %143, label %74, !llvm.loop !20

143:                                              ; preds = %137, %63
  %144 = phi float [ undef, %63 ], [ %138, %137 ]
  %145 = phi float addrspace(1)* [ undef, %63 ], [ %139, %137 ]
  %146 = phi float addrspace(1)* [ %64, %63 ], [ %139, %137 ]
  %147 = phi float [ %65, %63 ], [ %138, %137 ]
  %148 = phi i32 [ 0, %63 ], [ %140, %137 ]
  br i1 %39, label %179, label %149

149:                                              ; preds = %143
  %150 = sub i32 %59, %148
  br i1 %73, label %151, label %176

151:                                              ; preds = %149
  %152 = freeze i32 %150
  %153 = freeze i32 %10
  %154 = sdiv i32 %152, %153
  %155 = mul i32 %154, %153
  %156 = sub i32 %152, %155
  %157 = icmp eq i32 %156, 0
  %158 = icmp sgt i32 %70, -1
  %159 = and i1 %157, %158
  br i1 %159, label %160, label %176

160:                                              ; preds = %151
  %161 = icmp slt i32 %70, %5
  %162 = icmp sgt i32 %154, -1
  %163 = select i1 %161, i1 %162, i1 false
  %164 = icmp slt i32 %154, %6
  %165 = select i1 %163, i1 %164, i1 false
  br i1 %165, label %166, label %176

166:                                              ; preds = %160
  %167 = add nsw i32 %70, %62
  %168 = mul nsw i32 %167, %6
  %169 = add nsw i32 %168, %154
  %170 = load float, float addrspace(1)* %146, align 4, !tbaa !16
  %171 = sext i32 %169 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !16
  %174 = fmul contract float %170, %173
  %175 = fadd contract float %147, %174
  br label %176

176:                                              ; preds = %166, %160, %151, %149
  %177 = phi float [ %175, %166 ], [ %147, %160 ], [ %147, %151 ], [ %147, %149 ]
  %178 = getelementptr inbounds float, float addrspace(1)* %146, i64 1
  br label %179

179:                                              ; preds = %143, %176
  %180 = phi float [ %144, %143 ], [ %177, %176 ]
  %181 = phi float addrspace(1)* [ %145, %143 ], [ %178, %176 ]
  %182 = add nuw nsw i32 %66, 1
  %183 = icmp eq i32 %182, %9
  br i1 %183, label %184, label %63, !llvm.loop !22

184:                                              ; preds = %179, %40
  %185 = phi float [ 0.000000e+00, %40 ], [ %180, %179 ]
  %186 = sext i32 %41 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %12, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !16
  %189 = fadd contract float %185, %188
  store float %189, float addrspace(1)* %187, align 4, !tbaa !16
  %190 = add i32 %35, %41
  %191 = icmp slt i32 %190, %0
  br i1 %191, label %40, label %192, !llvm.loop !23

192:                                              ; preds = %184, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
