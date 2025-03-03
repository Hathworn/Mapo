; ModuleID = '../data/hip_kernels/820/17/main.cu'
source_filename = "../data/hip_kernels/820/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11calculationPcS_S_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %233

16:                                               ; preds = %5
  %17 = mul i32 %4, %4
  %18 = mul i32 %17, %14
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !amdgpu.noclobber !5
  %22 = icmp ne i8 %21, 0
  %23 = icmp sgt i32 %4, 0
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %233

25:                                               ; preds = %16
  %26 = and i32 %4, 7
  %27 = icmp ult i32 %4, 8
  %28 = and i32 %4, -8
  %29 = icmp eq i32 %26, 0
  %30 = and i32 %4, 7
  %31 = icmp ult i32 %4, 8
  %32 = and i32 %4, -8
  %33 = icmp eq i32 %30, 0
  br label %34

34:                                               ; preds = %25, %230
  %35 = phi i32 [ %231, %230 ], [ 0, %25 ]
  %36 = mul nsw i32 %35, %4
  %37 = add nsw i32 %36, %18
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7
  %41 = icmp slt i8 %40, 5
  br i1 %41, label %43, label %42

42:                                               ; preds = %34
  br i1 %27, label %214, label %121

43:                                               ; preds = %34
  br i1 %31, label %198, label %44

44:                                               ; preds = %43, %44
  %45 = phi i32 [ %118, %44 ], [ 0, %43 ]
  %46 = phi i32 [ %119, %44 ], [ 0, %43 ]
  %47 = add nsw i32 %45, %37
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !7
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %48
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7
  %53 = add i8 %52, %50
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %48
  store i8 %53, i8 addrspace(1)* %54, align 1, !tbaa !7
  %55 = or i32 %45, 1
  %56 = add nsw i32 %55, %37
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %57
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7
  %62 = add i8 %61, %59
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %57
  store i8 %62, i8 addrspace(1)* %63, align 1, !tbaa !7
  %64 = or i32 %45, 2
  %65 = add nsw i32 %64, %37
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %66
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !7
  %71 = add i8 %70, %68
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %66
  store i8 %71, i8 addrspace(1)* %72, align 1, !tbaa !7
  %73 = or i32 %45, 3
  %74 = add nsw i32 %73, %37
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %75
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !7
  %80 = add i8 %79, %77
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %75
  store i8 %80, i8 addrspace(1)* %81, align 1, !tbaa !7
  %82 = or i32 %45, 4
  %83 = add nsw i32 %82, %37
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %84
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !7
  %89 = add i8 %88, %86
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %84
  store i8 %89, i8 addrspace(1)* %90, align 1, !tbaa !7
  %91 = or i32 %45, 5
  %92 = add nsw i32 %91, %37
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %93
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !7
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %93
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7
  %98 = add i8 %97, %95
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %93
  store i8 %98, i8 addrspace(1)* %99, align 1, !tbaa !7
  %100 = or i32 %45, 6
  %101 = add nsw i32 %100, %37
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %102
  %104 = load i8, i8 addrspace(1)* %103, align 1, !tbaa !7
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %102
  %106 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !7
  %107 = add i8 %106, %104
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %102
  store i8 %107, i8 addrspace(1)* %108, align 1, !tbaa !7
  %109 = or i32 %45, 7
  %110 = add nsw i32 %109, %37
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %111
  %113 = load i8, i8 addrspace(1)* %112, align 1, !tbaa !7
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %111
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !7
  %116 = add i8 %115, %113
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %111
  store i8 %116, i8 addrspace(1)* %117, align 1, !tbaa !7
  %118 = add nuw nsw i32 %45, 8
  %119 = add i32 %46, 8
  %120 = icmp eq i32 %119, %32
  br i1 %120, label %198, label %44, !llvm.loop !10

121:                                              ; preds = %42, %121
  %122 = phi i32 [ %195, %121 ], [ 0, %42 ]
  %123 = phi i32 [ %196, %121 ], [ 0, %42 ]
  %124 = add nsw i32 %122, %37
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !7
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %125
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !7
  %130 = sub i8 %127, %129
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %125
  store i8 %130, i8 addrspace(1)* %131, align 1, !tbaa !7
  %132 = or i32 %122, 1
  %133 = add nsw i32 %132, %37
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %134
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !7
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %134
  %138 = load i8, i8 addrspace(1)* %137, align 1, !tbaa !7
  %139 = sub i8 %136, %138
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %134
  store i8 %139, i8 addrspace(1)* %140, align 1, !tbaa !7
  %141 = or i32 %122, 2
  %142 = add nsw i32 %141, %37
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %143
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !7
  %146 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %143
  %147 = load i8, i8 addrspace(1)* %146, align 1, !tbaa !7
  %148 = sub i8 %145, %147
  %149 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %143
  store i8 %148, i8 addrspace(1)* %149, align 1, !tbaa !7
  %150 = or i32 %122, 3
  %151 = add nsw i32 %150, %37
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %152
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !7
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %152
  %156 = load i8, i8 addrspace(1)* %155, align 1, !tbaa !7
  %157 = sub i8 %154, %156
  %158 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %152
  store i8 %157, i8 addrspace(1)* %158, align 1, !tbaa !7
  %159 = or i32 %122, 4
  %160 = add nsw i32 %159, %37
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %161
  %163 = load i8, i8 addrspace(1)* %162, align 1, !tbaa !7
  %164 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %161
  %165 = load i8, i8 addrspace(1)* %164, align 1, !tbaa !7
  %166 = sub i8 %163, %165
  %167 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %161
  store i8 %166, i8 addrspace(1)* %167, align 1, !tbaa !7
  %168 = or i32 %122, 5
  %169 = add nsw i32 %168, %37
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %170
  %172 = load i8, i8 addrspace(1)* %171, align 1, !tbaa !7
  %173 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %170
  %174 = load i8, i8 addrspace(1)* %173, align 1, !tbaa !7
  %175 = sub i8 %172, %174
  %176 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %170
  store i8 %175, i8 addrspace(1)* %176, align 1, !tbaa !7
  %177 = or i32 %122, 6
  %178 = add nsw i32 %177, %37
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %179
  %181 = load i8, i8 addrspace(1)* %180, align 1, !tbaa !7
  %182 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %179
  %183 = load i8, i8 addrspace(1)* %182, align 1, !tbaa !7
  %184 = sub i8 %181, %183
  %185 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %179
  store i8 %184, i8 addrspace(1)* %185, align 1, !tbaa !7
  %186 = or i32 %122, 7
  %187 = add nsw i32 %186, %37
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %188
  %190 = load i8, i8 addrspace(1)* %189, align 1, !tbaa !7
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %188
  %192 = load i8, i8 addrspace(1)* %191, align 1, !tbaa !7
  %193 = sub i8 %190, %192
  %194 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %188
  store i8 %193, i8 addrspace(1)* %194, align 1, !tbaa !7
  %195 = add nuw nsw i32 %122, 8
  %196 = add i32 %123, 8
  %197 = icmp eq i32 %196, %28
  br i1 %197, label %214, label %121, !llvm.loop !12

198:                                              ; preds = %44, %43
  %199 = phi i32 [ 0, %43 ], [ %118, %44 ]
  br i1 %33, label %230, label %200

200:                                              ; preds = %198, %200
  %201 = phi i32 [ %211, %200 ], [ %199, %198 ]
  %202 = phi i32 [ %212, %200 ], [ 0, %198 ]
  %203 = add nsw i32 %201, %37
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %204
  %206 = load i8, i8 addrspace(1)* %205, align 1, !tbaa !7
  %207 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %204
  %208 = load i8, i8 addrspace(1)* %207, align 1, !tbaa !7
  %209 = add i8 %208, %206
  %210 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %204
  store i8 %209, i8 addrspace(1)* %210, align 1, !tbaa !7
  %211 = add nuw nsw i32 %201, 1
  %212 = add i32 %202, 1
  %213 = icmp eq i32 %212, %30
  br i1 %213, label %230, label %200, !llvm.loop !13

214:                                              ; preds = %121, %42
  %215 = phi i32 [ 0, %42 ], [ %195, %121 ]
  br i1 %29, label %230, label %216

216:                                              ; preds = %214, %216
  %217 = phi i32 [ %227, %216 ], [ %215, %214 ]
  %218 = phi i32 [ %228, %216 ], [ 0, %214 ]
  %219 = add nsw i32 %217, %37
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %220
  %222 = load i8, i8 addrspace(1)* %221, align 1, !tbaa !7
  %223 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %220
  %224 = load i8, i8 addrspace(1)* %223, align 1, !tbaa !7
  %225 = sub i8 %222, %224
  %226 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %220
  store i8 %225, i8 addrspace(1)* %226, align 1, !tbaa !7
  %227 = add nuw nsw i32 %217, 1
  %228 = add i32 %218, 1
  %229 = icmp eq i32 %228, %26
  br i1 %229, label %230, label %216, !llvm.loop !15

230:                                              ; preds = %214, %216, %198, %200
  %231 = add nuw nsw i32 %35, 1
  %232 = icmp eq i32 %231, %4
  br i1 %232, label %233, label %34, !llvm.loop !16

233:                                              ; preds = %230, %16, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !11}
