; ModuleID = '../data/hip_kernels/14238/0/main.cu'
source_filename = "../data/hip_kernels/14238/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13AddPackKernelPmPiiS0_iiiiS0_S0_(i64 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %7
  br i1 %23, label %24, label %231

24:                                               ; preds = %10
  %25 = icmp sgt i32 %2, 0
  %26 = icmp sgt i32 %4, 0
  %27 = udiv i32 %19, %16
  %28 = mul i32 %27, %16
  %29 = icmp ugt i32 %19, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %16
  %33 = and i32 %2, 7
  %34 = icmp ult i32 %2, 8
  %35 = and i32 %2, -8
  %36 = icmp eq i32 %33, 0
  %37 = and i32 %4, 3
  %38 = icmp ult i32 %4, 4
  %39 = and i32 %4, -4
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %24, %183
  %42 = phi i32 [ %22, %24 ], [ %184, %183 ]
  br i1 %25, label %43, label %159

43:                                               ; preds = %41
  br i1 %34, label %138, label %44

44:                                               ; preds = %43, %44
  %45 = phi i32 [ %135, %44 ], [ 0, %43 ]
  %46 = phi i32 [ %134, %44 ], [ 0, %43 ]
  %47 = phi i32 [ %136, %44 ], [ 0, %43 ]
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !16
  %51 = mul nsw i32 %45, %7
  %52 = add nsw i32 %51, %42
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !16
  %56 = mul i32 %55, %50
  %57 = add i32 %56, %46
  %58 = or i32 %45, 1
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !16
  %62 = mul nsw i32 %58, %7
  %63 = add nsw i32 %62, %42
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !16
  %67 = mul i32 %66, %61
  %68 = add i32 %67, %57
  %69 = or i32 %45, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !16
  %73 = mul nsw i32 %69, %7
  %74 = add nsw i32 %73, %42
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !16
  %78 = mul i32 %77, %72
  %79 = add i32 %78, %68
  %80 = or i32 %45, 3
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !16
  %84 = mul nsw i32 %80, %7
  %85 = add nsw i32 %84, %42
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !16
  %89 = mul i32 %88, %83
  %90 = add i32 %89, %79
  %91 = or i32 %45, 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !16
  %95 = mul nsw i32 %91, %7
  %96 = add nsw i32 %95, %42
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !16
  %100 = mul i32 %99, %94
  %101 = add i32 %100, %90
  %102 = or i32 %45, 5
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !16
  %106 = mul nsw i32 %102, %7
  %107 = add nsw i32 %106, %42
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !16
  %111 = mul i32 %110, %105
  %112 = add i32 %111, %101
  %113 = or i32 %45, 6
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !16
  %117 = mul nsw i32 %113, %7
  %118 = add nsw i32 %117, %42
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !16
  %122 = mul i32 %121, %116
  %123 = add i32 %122, %112
  %124 = or i32 %45, 7
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !16
  %128 = mul nsw i32 %124, %7
  %129 = add nsw i32 %128, %42
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !16
  %133 = mul i32 %132, %127
  %134 = add i32 %133, %123
  %135 = add nuw nsw i32 %45, 8
  %136 = add i32 %47, 8
  %137 = icmp eq i32 %136, %35
  br i1 %137, label %138, label %44, !llvm.loop !20

138:                                              ; preds = %44, %43
  %139 = phi i32 [ undef, %43 ], [ %134, %44 ]
  %140 = phi i32 [ 0, %43 ], [ %135, %44 ]
  %141 = phi i32 [ 0, %43 ], [ %134, %44 ]
  br i1 %36, label %159, label %142

142:                                              ; preds = %138, %142
  %143 = phi i32 [ %156, %142 ], [ %140, %138 ]
  %144 = phi i32 [ %155, %142 ], [ %141, %138 ]
  %145 = phi i32 [ %157, %142 ], [ 0, %138 ]
  %146 = zext i32 %143 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !16
  %149 = mul nsw i32 %143, %7
  %150 = add nsw i32 %149, %42
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !16
  %154 = mul i32 %153, %148
  %155 = add i32 %154, %144
  %156 = add nuw nsw i32 %143, 1
  %157 = add i32 %145, 1
  %158 = icmp eq i32 %157, %33
  br i1 %158, label %159, label %142, !llvm.loop !22

159:                                              ; preds = %138, %142, %41
  %160 = phi i32 [ 0, %41 ], [ %139, %138 ], [ %155, %142 ]
  %161 = sext i32 %160 to i64
  %162 = add i32 %42, %5
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %163
  store i64 %161, i64 addrspace(1)* %164, align 8, !tbaa !24
  br i1 %26, label %165, label %183

165:                                              ; preds = %159
  br i1 %38, label %166, label %186

166:                                              ; preds = %186, %165
  %167 = phi i32 [ 0, %165 ], [ %228, %186 ]
  br i1 %40, label %183, label %168

168:                                              ; preds = %166, %168
  %169 = phi i32 [ %180, %168 ], [ %167, %166 ]
  %170 = phi i32 [ %181, %168 ], [ 0, %166 ]
  %171 = mul nsw i32 %169, %7
  %172 = add nsw i32 %171, %42
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %173
  %175 = load i32, i32 addrspace(1)* %174, align 4, !tbaa !16
  %176 = mul nsw i32 %169, %6
  %177 = add i32 %162, %176
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %178
  store i32 %175, i32 addrspace(1)* %179, align 4, !tbaa !16
  %180 = add nuw nsw i32 %169, 1
  %181 = add i32 %170, 1
  %182 = icmp eq i32 %181, %37
  br i1 %182, label %183, label %168, !llvm.loop !26

183:                                              ; preds = %166, %168, %159
  %184 = add i32 %32, %42
  %185 = icmp slt i32 %184, %7
  br i1 %185, label %41, label %231, !llvm.loop !27

186:                                              ; preds = %165, %186
  %187 = phi i32 [ %228, %186 ], [ 0, %165 ]
  %188 = phi i32 [ %229, %186 ], [ 0, %165 ]
  %189 = mul nsw i32 %187, %7
  %190 = add nsw i32 %189, %42
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %191
  %193 = load i32, i32 addrspace(1)* %192, align 4, !tbaa !16
  %194 = mul nsw i32 %187, %6
  %195 = add i32 %162, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %196
  store i32 %193, i32 addrspace(1)* %197, align 4, !tbaa !16
  %198 = or i32 %187, 1
  %199 = mul nsw i32 %198, %7
  %200 = add nsw i32 %199, %42
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %201
  %203 = load i32, i32 addrspace(1)* %202, align 4, !tbaa !16
  %204 = mul nsw i32 %198, %6
  %205 = add i32 %162, %204
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %206
  store i32 %203, i32 addrspace(1)* %207, align 4, !tbaa !16
  %208 = or i32 %187, 2
  %209 = mul nsw i32 %208, %7
  %210 = add nsw i32 %209, %42
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %211
  %213 = load i32, i32 addrspace(1)* %212, align 4, !tbaa !16
  %214 = mul nsw i32 %208, %6
  %215 = add i32 %162, %214
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %216
  store i32 %213, i32 addrspace(1)* %217, align 4, !tbaa !16
  %218 = or i32 %187, 3
  %219 = mul nsw i32 %218, %7
  %220 = add nsw i32 %219, %42
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %221
  %223 = load i32, i32 addrspace(1)* %222, align 4, !tbaa !16
  %224 = mul nsw i32 %218, %6
  %225 = add i32 %162, %224
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %226
  store i32 %223, i32 addrspace(1)* %227, align 4, !tbaa !16
  %228 = add nuw nsw i32 %187, 4
  %229 = add i32 %188, 4
  %230 = icmp eq i32 %229, %39
  br i1 %230, label %166, label %186, !llvm.loop !28

231:                                              ; preds = %183, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = !{!25, !25, i64 0}
!25 = !{!"long", !18, i64 0}
!26 = distinct !{!26, !23}
!27 = distinct !{!27, !21}
!28 = distinct !{!28, !21}
