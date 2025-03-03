; ModuleID = '../data/hip_kernels/528/4/main.cu'
source_filename = "../data/hip_kernels/528/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z2k3iPiPbS_S0_S0_S_S0_S_S_S0_(i32 %0, i32 addrspace(1)* nocapture %1, i8 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i8 addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture %6, i8 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture %9, i8 addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  store i8 0, i8 addrspace(1)* %10, align 1, !tbaa !4
  %12 = add nsw i32 %0, -1
  store i32 %12, i32 addrspace(1)* %1, align 4, !tbaa !8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %21, label %14

14:                                               ; preds = %11
  %15 = icmp sgt i32 %0, 0
  br label %16

16:                                               ; preds = %14, %39
  %17 = phi i32 [ 1, %14 ], [ %41, %39 ]
  %18 = phi i32 [ %12, %14 ], [ %40, %39 ]
  br i1 %15, label %19, label %39

19:                                               ; preds = %16
  %20 = mul nsw i32 %18, %0
  br label %25

21:                                               ; preds = %39, %11
  %22 = icmp sgt i32 %0, 0
  br i1 %22, label %23, label %77

23:                                               ; preds = %21
  %24 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !8
  br label %43

25:                                               ; preds = %19, %36
  %26 = phi i32 [ 0, %19 ], [ %37, %36 ]
  %27 = add nsw i32 %26, %20
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !4, !range !10
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %36, label %32

32:                                               ; preds = %25
  %33 = sext i32 %17 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  store i32 %26, i32 addrspace(1)* %34, align 4, !tbaa !8
  %35 = add nsw i32 %17, 1
  br label %39

36:                                               ; preds = %25
  %37 = add nuw nsw i32 %26, 1
  %38 = icmp eq i32 %37, %0
  br i1 %38, label %39, label %25, !llvm.loop !11

39:                                               ; preds = %36, %16, %32
  %40 = phi i32 [ %26, %32 ], [ %18, %16 ], [ %18, %36 ]
  %41 = phi i32 [ %35, %32 ], [ %17, %16 ], [ %17, %36 ]
  %42 = icmp eq i32 %40, 0
  br i1 %42, label %21, label %16, !llvm.loop !13

43:                                               ; preds = %23, %71
  %44 = phi i32 [ %52, %71 ], [ %24, %23 ]
  %45 = phi i32 [ %49, %71 ], [ 0, %23 ]
  %46 = phi i32 [ %75, %71 ], [ -1, %23 ]
  %47 = icmp eq i32 %44, 0
  br i1 %47, label %77, label %48

48:                                               ; preds = %43
  %49 = add nuw nsw i32 %45, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !8
  %53 = mul nsw i32 %52, %0
  %54 = add nsw i32 %53, %44
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !4, !range !10
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %65, label %59

59:                                               ; preds = %48
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %55
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !8
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %55
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !8
  %64 = sub nsw i32 %61, %63
  br label %71

65:                                               ; preds = %48
  %66 = mul nsw i32 %44, %0
  %67 = add nsw i32 %52, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !8
  br label %71

71:                                               ; preds = %65, %59
  %72 = phi i32 [ %64, %59 ], [ %70, %65 ]
  %73 = icmp eq i32 %46, -1
  %74 = tail call i32 @llvm.smin.i32(i32 %72, i32 %46)
  %75 = select i1 %73, i32 %72, i32 %74
  %76 = icmp eq i32 %49, %0
  br i1 %76, label %77, label %43, !llvm.loop !14

77:                                               ; preds = %71, %43, %21
  %78 = phi i32 [ -1, %21 ], [ %75, %71 ], [ %46, %43 ]
  %79 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !8
  %80 = add nsw i32 %79, %78
  store i32 %80, i32 addrspace(1)* %9, align 4, !tbaa !8
  br i1 %22, label %81, label %111

81:                                               ; preds = %77, %109
  %82 = phi i32 [ %88, %109 ], [ 0, %77 ]
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !8
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %111, label %87

87:                                               ; preds = %81
  %88 = add nuw nsw i32 %82, 1
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !8
  %92 = mul nsw i32 %91, %0
  %93 = add nsw i32 %92, %85
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %94
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !4, !range !10
  %97 = icmp eq i8 %96, 0
  br i1 %97, label %102, label %98

98:                                               ; preds = %87
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %94
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !8
  %101 = add nsw i32 %100, %78
  store i32 %101, i32 addrspace(1)* %99, align 4, !tbaa !8
  br label %109

102:                                              ; preds = %87
  %103 = mul nsw i32 %85, %0
  %104 = add nsw i32 %91, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !8
  %108 = sub nsw i32 %107, %78
  store i32 %108, i32 addrspace(1)* %106, align 4, !tbaa !8
  br label %109

109:                                              ; preds = %102, %98
  %110 = icmp eq i32 %88, %0
  br i1 %110, label %111, label %81, !llvm.loop !15

111:                                              ; preds = %109, %81, %77
  %112 = icmp eq i32 %0, 0
  br i1 %112, label %132, label %113

113:                                              ; preds = %111
  %114 = mul i32 %0, %0
  %115 = tail call i32 @llvm.umax.i32(i32 %114, i32 1)
  %116 = add i32 %115, -1
  %117 = and i32 %115, 7
  %118 = icmp ult i32 %116, 7
  br i1 %118, label %121, label %119

119:                                              ; preds = %113
  %120 = and i32 %115, -8
  br label %138

121:                                              ; preds = %138, %113
  %122 = phi i32 [ 0, %113 ], [ %164, %138 ]
  %123 = icmp eq i32 %117, 0
  br i1 %123, label %132, label %124

124:                                              ; preds = %121, %124
  %125 = phi i32 [ %129, %124 ], [ %122, %121 ]
  %126 = phi i32 [ %130, %124 ], [ 0, %121 ]
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %127
  store i8 0, i8 addrspace(1)* %128, align 1, !tbaa !4
  %129 = add nuw nsw i32 %125, 1
  %130 = add i32 %126, 1
  %131 = icmp eq i32 %130, %117
  br i1 %131, label %132, label %124, !llvm.loop !16

132:                                              ; preds = %121, %124, %111
  br i1 %22, label %133, label %224

133:                                              ; preds = %132
  %134 = and i32 %0, 7
  %135 = icmp ult i32 %0, 8
  br i1 %135, label %167, label %136

136:                                              ; preds = %133
  %137 = and i32 %0, -8
  br label %184

138:                                              ; preds = %138, %119
  %139 = phi i32 [ 0, %119 ], [ %164, %138 ]
  %140 = phi i32 [ 0, %119 ], [ %165, %138 ]
  %141 = zext i32 %139 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %141
  store i8 0, i8 addrspace(1)* %142, align 1, !tbaa !4
  %143 = or i32 %139, 1
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %144
  store i8 0, i8 addrspace(1)* %145, align 1, !tbaa !4
  %146 = or i32 %139, 2
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %147
  store i8 0, i8 addrspace(1)* %148, align 1, !tbaa !4
  %149 = or i32 %139, 3
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %150
  store i8 0, i8 addrspace(1)* %151, align 1, !tbaa !4
  %152 = or i32 %139, 4
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %153
  store i8 0, i8 addrspace(1)* %154, align 1, !tbaa !4
  %155 = or i32 %139, 5
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %156
  store i8 0, i8 addrspace(1)* %157, align 1, !tbaa !4
  %158 = or i32 %139, 6
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %159
  store i8 0, i8 addrspace(1)* %160, align 1, !tbaa !4
  %161 = or i32 %139, 7
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %162
  store i8 0, i8 addrspace(1)* %163, align 1, !tbaa !4
  %164 = add nuw nsw i32 %139, 8
  %165 = add i32 %140, 8
  %166 = icmp eq i32 %165, %120
  br i1 %166, label %121, label %138, !llvm.loop !18

167:                                              ; preds = %184, %133
  %168 = phi i32 [ 0, %133 ], [ %210, %184 ]
  %169 = icmp eq i32 %134, 0
  br i1 %169, label %178, label %170

170:                                              ; preds = %167, %170
  %171 = phi i32 [ %175, %170 ], [ %168, %167 ]
  %172 = phi i32 [ %176, %170 ], [ 0, %167 ]
  %173 = zext i32 %171 to i64
  %174 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %173
  store i8 0, i8 addrspace(1)* %174, align 1, !tbaa !4
  %175 = add nuw nsw i32 %171, 1
  %176 = add i32 %172, 1
  %177 = icmp eq i32 %176, %134
  br i1 %177, label %178, label %170, !llvm.loop !19

178:                                              ; preds = %170, %167
  br i1 %22, label %179, label %224

179:                                              ; preds = %178
  %180 = and i32 %0, 7
  %181 = icmp ult i32 %0, 8
  br i1 %181, label %213, label %182

182:                                              ; preds = %179
  %183 = and i32 %0, -8
  br label %226

184:                                              ; preds = %184, %136
  %185 = phi i32 [ 0, %136 ], [ %210, %184 ]
  %186 = phi i32 [ 0, %136 ], [ %211, %184 ]
  %187 = zext i32 %185 to i64
  %188 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %187
  store i8 0, i8 addrspace(1)* %188, align 1, !tbaa !4
  %189 = or i32 %185, 1
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %190
  store i8 0, i8 addrspace(1)* %191, align 1, !tbaa !4
  %192 = or i32 %185, 2
  %193 = zext i32 %192 to i64
  %194 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %193
  store i8 0, i8 addrspace(1)* %194, align 1, !tbaa !4
  %195 = or i32 %185, 3
  %196 = zext i32 %195 to i64
  %197 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %196
  store i8 0, i8 addrspace(1)* %197, align 1, !tbaa !4
  %198 = or i32 %185, 4
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %199
  store i8 0, i8 addrspace(1)* %200, align 1, !tbaa !4
  %201 = or i32 %185, 5
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %202
  store i8 0, i8 addrspace(1)* %203, align 1, !tbaa !4
  %204 = or i32 %185, 6
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %205
  store i8 0, i8 addrspace(1)* %206, align 1, !tbaa !4
  %207 = or i32 %185, 7
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %208
  store i8 0, i8 addrspace(1)* %209, align 1, !tbaa !4
  %210 = add nuw nsw i32 %185, 8
  %211 = add i32 %186, 8
  %212 = icmp eq i32 %211, %137
  br i1 %212, label %167, label %184, !llvm.loop !20

213:                                              ; preds = %226, %179
  %214 = phi i32 [ 0, %179 ], [ %252, %226 ]
  %215 = icmp eq i32 %180, 0
  br i1 %215, label %224, label %216

216:                                              ; preds = %213, %216
  %217 = phi i32 [ %221, %216 ], [ %214, %213 ]
  %218 = phi i32 [ %222, %216 ], [ 0, %213 ]
  %219 = zext i32 %217 to i64
  %220 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %219
  store i8 0, i8 addrspace(1)* %220, align 1, !tbaa !4
  %221 = add nuw nsw i32 %217, 1
  %222 = add i32 %218, 1
  %223 = icmp eq i32 %222, %180
  br i1 %223, label %224, label %216, !llvm.loop !21

224:                                              ; preds = %213, %216, %132, %178
  store i8 1, i8 addrspace(1)* %2, align 1, !tbaa !4
  store i32 1, i32 addrspace(1)* %3, align 4, !tbaa !8
  %225 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 1
  store i32 0, i32 addrspace(1)* %225, align 4, !tbaa !8
  ret void

226:                                              ; preds = %226, %182
  %227 = phi i32 [ 0, %182 ], [ %252, %226 ]
  %228 = phi i32 [ 0, %182 ], [ %253, %226 ]
  %229 = zext i32 %227 to i64
  %230 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %229
  store i8 0, i8 addrspace(1)* %230, align 1, !tbaa !4
  %231 = or i32 %227, 1
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %232
  store i8 0, i8 addrspace(1)* %233, align 1, !tbaa !4
  %234 = or i32 %227, 2
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %235
  store i8 0, i8 addrspace(1)* %236, align 1, !tbaa !4
  %237 = or i32 %227, 3
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %238
  store i8 0, i8 addrspace(1)* %239, align 1, !tbaa !4
  %240 = or i32 %227, 4
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %241
  store i8 0, i8 addrspace(1)* %242, align 1, !tbaa !4
  %243 = or i32 %227, 5
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %244
  store i8 0, i8 addrspace(1)* %245, align 1, !tbaa !4
  %246 = or i32 %227, 6
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %247
  store i8 0, i8 addrspace(1)* %248, align 1, !tbaa !4
  %249 = or i32 %227, 7
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %250
  store i8 0, i8 addrspace(1)* %251, align 1, !tbaa !4
  %252 = add nuw nsw i32 %227, 8
  %253 = add i32 %228, 8
  %254 = icmp eq i32 %253, %183
  br i1 %254, label %213, label %226, !llvm.loop !22
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"bool", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{i8 0, i8 2}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !17}
!22 = distinct !{!22, !12}
