; ModuleID = '../data/hip_kernels/260/15/main.cu'
source_filename = "../data/hip_kernels/260/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7FindPosPiPbiii(i32 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul i32 %6, %4
  %16 = icmp slt i32 %14, %2
  br i1 %16, label %17, label %240

17:                                               ; preds = %5
  %18 = add nuw nsw i32 %13, %11
  %19 = add i32 %18, %15
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %236, label %24

24:                                               ; preds = %17
  %25 = icmp eq i32 %6, 0
  %26 = shl nuw nsw i32 %11, 1
  %27 = add nsw i32 %26, -1
  %28 = sub i32 %15, %4
  %29 = add nsw i32 %15, -1
  br label %30

30:                                               ; preds = %56, %24
  %31 = phi i1 [ true, %24 ], [ %57, %56 ]
  %32 = phi i32 [ %18, %24 ], [ %58, %56 ]
  %33 = phi i32 [ %11, %24 ], [ %59, %56 ]
  %34 = phi i32 [ %27, %24 ], [ %60, %56 ]
  %35 = phi i32 [ 0, %24 ], [ %61, %56 ]
  %36 = icmp eq i32 %35, %3
  br i1 %36, label %63, label %37

37:                                               ; preds = %30
  %38 = icmp sgt i32 %32, %33
  br i1 %38, label %42, label %39

39:                                               ; preds = %37
  br i1 %25, label %56, label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %28, %34
  br label %44

42:                                               ; preds = %37
  %43 = add i32 %29, %32
  br label %44

44:                                               ; preds = %42, %40
  %45 = phi i1 [ false, %40 ], [ %31, %42 ]
  %46 = phi i32 [ %41, %40 ], [ %43, %42 ]
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %56, label %51

51:                                               ; preds = %44
  %52 = add nsw i32 %33, -1
  %53 = sdiv i32 %33, 2
  %54 = sdiv i32 %32, 2
  %55 = add nsw i32 %35, 1
  br label %56

56:                                               ; preds = %44, %39, %51
  %57 = phi i1 [ %45, %51 ], [ %31, %39 ], [ %45, %44 ]
  %58 = phi i32 [ %54, %51 ], [ %32, %39 ], [ %32, %44 ]
  %59 = phi i32 [ %53, %51 ], [ %33, %39 ], [ %33, %44 ]
  %60 = phi i32 [ %52, %51 ], [ %34, %39 ], [ %34, %44 ]
  %61 = phi i32 [ %55, %51 ], [ %35, %39 ], [ %35, %44 ]
  %62 = phi i1 [ true, %51 ], [ false, %39 ], [ false, %44 ]
  br i1 %62, label %30, label %63

63:                                               ; preds = %56, %30
  %64 = phi i1 [ %57, %56 ], [ %31, %30 ]
  %65 = phi i32 [ %58, %56 ], [ %32, %30 ]
  %66 = phi i32 [ %59, %56 ], [ %33, %30 ]
  %67 = phi i32 [ %60, %56 ], [ %34, %30 ]
  %68 = phi i32 [ %61, %56 ], [ %3, %30 ]
  %69 = icmp eq i32 %68, %3
  %70 = select i1 %25, i1 %64, i1 false
  %71 = select i1 %69, i1 %70, i1 %64
  %72 = icmp sgt i32 %65, %66
  %73 = sext i1 %72 to i32
  %74 = add nsw i32 %65, %73
  %75 = select i1 %71, i32 0, i32 %4
  %76 = select i1 %71, i32 %74, i32 %67
  %77 = sub nsw i32 %15, %75
  %78 = icmp eq i32 %68, 0
  br i1 %78, label %223, label %79

79:                                               ; preds = %63
  %80 = and i32 %68, 7
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %102, label %82

82:                                               ; preds = %79, %97
  %83 = phi i32 [ %99, %97 ], [ %68, %79 ]
  %84 = phi i32 [ %98, %97 ], [ %76, %79 ]
  %85 = phi i32 [ %100, %97 ], [ 0, %79 ]
  %86 = icmp eq i32 %83, %3
  %87 = select i1 %86, i1 %71, i1 false
  %88 = shl nsw i32 %84, 1
  br i1 %87, label %97, label %89

89:                                               ; preds = %82
  %90 = add nuw nsw i32 %88, 1
  %91 = add i32 %90, %77
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %92
  %94 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %95 = icmp eq i8 %94, 0
  %96 = select i1 %95, i32 %90, i32 %88
  br label %97

97:                                               ; preds = %89, %82
  %98 = phi i32 [ %88, %82 ], [ %96, %89 ]
  %99 = add nsw i32 %83, -1
  %100 = add i32 %85, 1
  %101 = icmp eq i32 %100, %80
  br i1 %101, label %102, label %82, !llvm.loop !12

102:                                              ; preds = %97, %79
  %103 = phi i32 [ undef, %79 ], [ %98, %97 ]
  %104 = phi i32 [ %68, %79 ], [ %99, %97 ]
  %105 = phi i32 [ %76, %79 ], [ %98, %97 ]
  %106 = icmp ult i32 %68, 8
  br i1 %106, label %223, label %107

107:                                              ; preds = %102, %219
  %108 = phi i32 [ %221, %219 ], [ %104, %102 ]
  %109 = phi i32 [ %220, %219 ], [ %105, %102 ]
  %110 = icmp eq i32 %108, %3
  %111 = select i1 %110, i1 %71, i1 false
  %112 = shl nsw i32 %109, 1
  br i1 %111, label %121, label %113

113:                                              ; preds = %107
  %114 = add nuw nsw i32 %112, 1
  %115 = add i32 %114, %77
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %116
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %119 = icmp eq i8 %118, 0
  %120 = select i1 %119, i32 %114, i32 %112
  br label %121

121:                                              ; preds = %113, %107
  %122 = phi i32 [ %112, %107 ], [ %120, %113 ]
  %123 = add nsw i32 %108, -1
  %124 = icmp eq i32 %123, %3
  %125 = select i1 %124, i1 %71, i1 false
  %126 = shl nsw i32 %122, 1
  br i1 %125, label %135, label %127

127:                                              ; preds = %121
  %128 = add nuw nsw i32 %126, 1
  %129 = add i32 %128, %77
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %130
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %133 = icmp eq i8 %132, 0
  %134 = select i1 %133, i32 %128, i32 %126
  br label %135

135:                                              ; preds = %127, %121
  %136 = phi i32 [ %126, %121 ], [ %134, %127 ]
  %137 = add nsw i32 %108, -2
  %138 = icmp eq i32 %137, %3
  %139 = select i1 %138, i1 %71, i1 false
  %140 = shl nsw i32 %136, 1
  br i1 %139, label %149, label %141

141:                                              ; preds = %135
  %142 = add nuw nsw i32 %140, 1
  %143 = add i32 %142, %77
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %144
  %146 = load i8, i8 addrspace(1)* %145, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %147 = icmp eq i8 %146, 0
  %148 = select i1 %147, i32 %142, i32 %140
  br label %149

149:                                              ; preds = %141, %135
  %150 = phi i32 [ %140, %135 ], [ %148, %141 ]
  %151 = add nsw i32 %108, -3
  %152 = icmp eq i32 %151, %3
  %153 = select i1 %152, i1 %71, i1 false
  %154 = shl nsw i32 %150, 1
  br i1 %153, label %163, label %155

155:                                              ; preds = %149
  %156 = add nuw nsw i32 %154, 1
  %157 = add i32 %156, %77
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %158
  %160 = load i8, i8 addrspace(1)* %159, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %161 = icmp eq i8 %160, 0
  %162 = select i1 %161, i32 %156, i32 %154
  br label %163

163:                                              ; preds = %155, %149
  %164 = phi i32 [ %154, %149 ], [ %162, %155 ]
  %165 = add nsw i32 %108, -4
  %166 = icmp eq i32 %165, %3
  %167 = select i1 %166, i1 %71, i1 false
  %168 = shl nsw i32 %164, 1
  br i1 %167, label %177, label %169

169:                                              ; preds = %163
  %170 = add nuw nsw i32 %168, 1
  %171 = add i32 %170, %77
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %172
  %174 = load i8, i8 addrspace(1)* %173, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %175 = icmp eq i8 %174, 0
  %176 = select i1 %175, i32 %170, i32 %168
  br label %177

177:                                              ; preds = %169, %163
  %178 = phi i32 [ %168, %163 ], [ %176, %169 ]
  %179 = add nsw i32 %108, -5
  %180 = icmp eq i32 %179, %3
  %181 = select i1 %180, i1 %71, i1 false
  %182 = shl nsw i32 %178, 1
  br i1 %181, label %191, label %183

183:                                              ; preds = %177
  %184 = add nuw nsw i32 %182, 1
  %185 = add i32 %184, %77
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %186
  %188 = load i8, i8 addrspace(1)* %187, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %189 = icmp eq i8 %188, 0
  %190 = select i1 %189, i32 %184, i32 %182
  br label %191

191:                                              ; preds = %183, %177
  %192 = phi i32 [ %182, %177 ], [ %190, %183 ]
  %193 = add nsw i32 %108, -6
  %194 = icmp eq i32 %193, %3
  %195 = select i1 %194, i1 %71, i1 false
  %196 = shl nsw i32 %192, 1
  br i1 %195, label %205, label %197

197:                                              ; preds = %191
  %198 = add nuw nsw i32 %196, 1
  %199 = add i32 %198, %77
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %200
  %202 = load i8, i8 addrspace(1)* %201, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %203 = icmp eq i8 %202, 0
  %204 = select i1 %203, i32 %198, i32 %196
  br label %205

205:                                              ; preds = %197, %191
  %206 = phi i32 [ %196, %191 ], [ %204, %197 ]
  %207 = add nsw i32 %108, -7
  %208 = icmp eq i32 %207, %3
  %209 = select i1 %208, i1 %71, i1 false
  %210 = shl nsw i32 %206, 1
  br i1 %209, label %219, label %211

211:                                              ; preds = %205
  %212 = add nuw nsw i32 %210, 1
  %213 = add i32 %212, %77
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %214
  %216 = load i8, i8 addrspace(1)* %215, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %217 = icmp eq i8 %216, 0
  %218 = select i1 %217, i32 %212, i32 %210
  br label %219

219:                                              ; preds = %211, %205
  %220 = phi i32 [ %210, %205 ], [ %218, %211 ]
  %221 = add nsw i32 %108, -8
  %222 = icmp eq i32 %221, 0
  br i1 %222, label %223, label %107, !llvm.loop !14

223:                                              ; preds = %102, %219, %63
  %224 = phi i32 [ %76, %63 ], [ %103, %102 ], [ %220, %219 ]
  br i1 %71, label %225, label %233

225:                                              ; preds = %223
  %226 = add nsw i32 %224, %77
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %227
  %229 = load i8, i8 addrspace(1)* %228, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %230 = zext i8 %229 to i32
  %231 = sub i32 %18, %224
  %232 = add i32 %231, %230
  br label %236

233:                                              ; preds = %223
  %234 = add i32 %13, %4
  %235 = sub i32 %234, %224
  br label %236

236:                                              ; preds = %225, %233, %17
  %237 = phi i32 [ 0, %17 ], [ %232, %225 ], [ %235, %233 ]
  %238 = sext i32 %14 to i64
  %239 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %238
  store i32 %237, i32 addrspace(1)* %239, align 4, !tbaa !16
  br label %240

240:                                              ; preds = %236, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !9, i64 0}
