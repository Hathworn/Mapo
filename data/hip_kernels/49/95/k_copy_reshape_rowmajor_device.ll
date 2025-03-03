; ModuleID = '../data/hip_kernels/49/95/main.cu'
source_filename = "../data/hip_kernels/49/95/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23k_copy_reshape_rowmajorjjPKfPKiS2_jPfS2_S2_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = udiv i32 %18, %15
  %23 = mul i32 %22, %15
  %24 = icmp ugt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %15
  %28 = icmp ult i32 %21, %0
  br i1 %28, label %29, label %43

29:                                               ; preds = %9
  %30 = icmp eq i32 %1, 0
  %31 = icmp eq i32 %5, 0
  %32 = and i32 %1, 3
  %33 = icmp ult i32 %1, 4
  %34 = and i32 %1, -4
  %35 = icmp eq i32 %32, 0
  %36 = and i32 %5, 3
  %37 = icmp ult i32 %5, 4
  %38 = and i32 %5, -4
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %29, %168
  %41 = phi i32 [ %21, %29 ], [ %171, %168 ]
  br i1 %30, label %72, label %42

42:                                               ; preds = %40
  br i1 %33, label %44, label %75

43:                                               ; preds = %168, %9
  ret void

44:                                               ; preds = %75, %42
  %45 = phi float addrspace(1)* [ undef, %42 ], [ %136, %75 ]
  %46 = phi float addrspace(1)* [ %2, %42 ], [ %136, %75 ]
  %47 = phi i32 [ %41, %42 ], [ %129, %75 ]
  %48 = phi i32 [ 0, %42 ], [ %137, %75 ]
  br i1 %35, label %72, label %49

49:                                               ; preds = %44, %49
  %50 = phi float addrspace(1)* [ %68, %49 ], [ %46, %44 ]
  %51 = phi i32 [ %61, %49 ], [ %47, %44 ]
  %52 = phi i32 [ %69, %49 ], [ %48, %44 ]
  %53 = phi i32 [ %70, %49 ], [ 0, %44 ]
  %54 = xor i32 %52, -1
  %55 = add i32 %54, %1
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !16, !amdgpu.noclobber !5
  %59 = freeze i32 %51
  %60 = freeze i32 %58
  %61 = sdiv i32 %59, %60
  %62 = mul i32 %61, %60
  %63 = sub i32 %59, %62
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %56
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !5
  %66 = mul nsw i32 %65, %63
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %50, i64 %67
  %69 = add nuw i32 %52, 1
  %70 = add i32 %53, 1
  %71 = icmp eq i32 %70, %32
  br i1 %71, label %72, label %49, !llvm.loop !20

72:                                               ; preds = %44, %49, %40
  %73 = phi float addrspace(1)* [ %2, %40 ], [ %45, %44 ], [ %68, %49 ]
  br i1 %31, label %168, label %74

74:                                               ; preds = %72
  br i1 %37, label %140, label %173

75:                                               ; preds = %42, %75
  %76 = phi float addrspace(1)* [ %136, %75 ], [ %2, %42 ]
  %77 = phi i32 [ %129, %75 ], [ %41, %42 ]
  %78 = phi i32 [ %137, %75 ], [ 0, %42 ]
  %79 = phi i32 [ %138, %75 ], [ 0, %42 ]
  %80 = xor i32 %78, -1
  %81 = add i32 %80, %1
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !16, !amdgpu.noclobber !5
  %85 = freeze i32 %77
  %86 = freeze i32 %84
  %87 = sdiv i32 %85, %86
  %88 = mul i32 %87, %86
  %89 = sub i32 %85, %88
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %82
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !16, !amdgpu.noclobber !5
  %92 = mul nsw i32 %91, %89
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %76, i64 %93
  %95 = sub i32 %1, %78
  %96 = add i32 %95, -2
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !16, !amdgpu.noclobber !5
  %100 = freeze i32 %99
  %101 = sdiv i32 %87, %100
  %102 = mul i32 %101, %100
  %103 = sub i32 %87, %102
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %97
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !5
  %106 = mul nsw i32 %105, %103
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %94, i64 %107
  %109 = sub i32 %1, %78
  %110 = add i32 %109, -3
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !16, !amdgpu.noclobber !5
  %114 = freeze i32 %113
  %115 = sdiv i32 %101, %114
  %116 = mul i32 %115, %114
  %117 = sub i32 %101, %116
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %111
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !5
  %120 = mul nsw i32 %119, %117
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %108, i64 %121
  %123 = sub i32 %1, %78
  %124 = add i32 %123, -4
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !16, !amdgpu.noclobber !5
  %128 = freeze i32 %127
  %129 = sdiv i32 %115, %128
  %130 = mul i32 %129, %128
  %131 = sub i32 %115, %130
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %125
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !16, !amdgpu.noclobber !5
  %134 = mul nsw i32 %133, %131
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %122, i64 %135
  %137 = add nuw i32 %78, 4
  %138 = add i32 %79, 4
  %139 = icmp eq i32 %138, %34
  br i1 %139, label %44, label %75, !llvm.loop !22

140:                                              ; preds = %173, %74
  %141 = phi float addrspace(1)* [ undef, %74 ], [ %234, %173 ]
  %142 = phi i32 [ 0, %74 ], [ %235, %173 ]
  %143 = phi float addrspace(1)* [ %6, %74 ], [ %234, %173 ]
  %144 = phi i32 [ %41, %74 ], [ %227, %173 ]
  br i1 %39, label %168, label %145

145:                                              ; preds = %140, %145
  %146 = phi i32 [ %165, %145 ], [ %142, %140 ]
  %147 = phi float addrspace(1)* [ %164, %145 ], [ %143, %140 ]
  %148 = phi i32 [ %157, %145 ], [ %144, %140 ]
  %149 = phi i32 [ %166, %145 ], [ 0, %140 ]
  %150 = xor i32 %146, -1
  %151 = add i32 %150, %5
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !16, !amdgpu.noclobber !5
  %155 = freeze i32 %148
  %156 = freeze i32 %154
  %157 = sdiv i32 %155, %156
  %158 = mul i32 %157, %156
  %159 = sub i32 %155, %158
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %152
  %161 = load i32, i32 addrspace(1)* %160, align 4, !tbaa !16, !amdgpu.noclobber !5
  %162 = mul nsw i32 %161, %159
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %147, i64 %163
  %165 = add nuw i32 %146, 1
  %166 = add i32 %149, 1
  %167 = icmp eq i32 %166, %36
  br i1 %167, label %168, label %145, !llvm.loop !24

168:                                              ; preds = %140, %145, %72
  %169 = phi float addrspace(1)* [ %6, %72 ], [ %141, %140 ], [ %164, %145 ]
  %170 = load float, float addrspace(1)* %73, align 4, !tbaa !25
  store float %170, float addrspace(1)* %169, align 4, !tbaa !25
  %171 = add i32 %41, %27
  %172 = icmp ult i32 %171, %0
  br i1 %172, label %40, label %43, !llvm.loop !27

173:                                              ; preds = %74, %173
  %174 = phi i32 [ %235, %173 ], [ 0, %74 ]
  %175 = phi float addrspace(1)* [ %234, %173 ], [ %6, %74 ]
  %176 = phi i32 [ %227, %173 ], [ %41, %74 ]
  %177 = phi i32 [ %236, %173 ], [ 0, %74 ]
  %178 = xor i32 %174, -1
  %179 = add i32 %178, %5
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %180
  %182 = load i32, i32 addrspace(1)* %181, align 4, !tbaa !16, !amdgpu.noclobber !5
  %183 = freeze i32 %176
  %184 = freeze i32 %182
  %185 = sdiv i32 %183, %184
  %186 = mul i32 %185, %184
  %187 = sub i32 %183, %186
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %180
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !16, !amdgpu.noclobber !5
  %190 = mul nsw i32 %189, %187
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %175, i64 %191
  %193 = sub i32 %5, %174
  %194 = add i32 %193, -2
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %195
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !16, !amdgpu.noclobber !5
  %198 = freeze i32 %197
  %199 = sdiv i32 %185, %198
  %200 = mul i32 %199, %198
  %201 = sub i32 %185, %200
  %202 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %195
  %203 = load i32, i32 addrspace(1)* %202, align 4, !tbaa !16, !amdgpu.noclobber !5
  %204 = mul nsw i32 %203, %201
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %192, i64 %205
  %207 = sub i32 %5, %174
  %208 = add i32 %207, -3
  %209 = zext i32 %208 to i64
  %210 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %209
  %211 = load i32, i32 addrspace(1)* %210, align 4, !tbaa !16, !amdgpu.noclobber !5
  %212 = freeze i32 %211
  %213 = sdiv i32 %199, %212
  %214 = mul i32 %213, %212
  %215 = sub i32 %199, %214
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %209
  %217 = load i32, i32 addrspace(1)* %216, align 4, !tbaa !16, !amdgpu.noclobber !5
  %218 = mul nsw i32 %217, %215
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %206, i64 %219
  %221 = sub i32 %5, %174
  %222 = add i32 %221, -4
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %223
  %225 = load i32, i32 addrspace(1)* %224, align 4, !tbaa !16, !amdgpu.noclobber !5
  %226 = freeze i32 %225
  %227 = sdiv i32 %213, %226
  %228 = mul i32 %227, %226
  %229 = sub i32 %213, %228
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %223
  %231 = load i32, i32 addrspace(1)* %230, align 4, !tbaa !16, !amdgpu.noclobber !5
  %232 = mul nsw i32 %231, %229
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %220, i64 %233
  %235 = add nuw i32 %174, 4
  %236 = add i32 %177, 4
  %237 = icmp eq i32 %236, %38
  br i1 %237, label %140, label %173, !llvm.loop !28
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !21}
!25 = !{!26, !26, i64 0}
!26 = !{!"float", !18, i64 0}
!27 = distinct !{!27, !23}
!28 = distinct !{!28, !23}
